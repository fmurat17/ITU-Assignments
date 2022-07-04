from flask import Flask, render_template, current_app, request, redirect, url_for, session, flash
from datetime import datetime
import re
from hashlib import sha256

from flask_mysqldb import MySQL
import mysql.connector

def getTimestampString():
    return " ~ ".join(str(datetime.now()).split(" ")).replace("-", "/")[:-7]

mysql_db = mysql.connector.connect(
   host="localhost",
   user="root",
   passwd="99!zi9kEg$7zIBc",
   database='flaskapp'
)

app = Flask(__name__)

app.secret_key = "123xqwe4"

mysql = MySQL(app)
     

app.config.from_object("settings")


@app.route("/")
def homepage():
    today = datetime.today()
    day_name = today.strftime("%A")
    return render_template("homepage.html", day=day_name)

@app.route("/register", methods=['GET', 'POST'])
def register():
    if request.method == 'POST' and 'username' in request.form and 'mail' in request.form and 'pw' in request.form and 'pw_again' in request.form:
        username = request.form['username']
        mail = request.form['mail']
        pw = request.form['pw']
        pw_again = request.form['pw_again']

        if not re.match(r'[^@]+@[^@]+\.[^@]+', mail):
            flash("Invalid e-mail addrress", "danger")
            return redirect(url_for("register"))
        
        if username.lower() == "admin":
            flash("This name is restricted. Please choose another name.", "danger")
            return redirect(url_for('register'))

        if len(pw) < 6:
            flash("Password must be at least 6 character!", "danger")
            return redirect(url_for("register"))

        if(pw != pw_again):
            flash("Entered passwords do not match!", "danger")
            return redirect(url_for('register'))

        if not re.match(r'[A-Za-z0-9]+', username): 
            flash("name must contain only characters and numbers !", "danger")
            return redirect(url_for("register"))
        
        #buffered=True,dictionary=True
        cur = mysql_db.cursor()
        cur.execute("SELECT * FROM User WHERE name = %s", (username,))
        account = cur.fetchall()

        if account:    
            cur.close()
            flash("This nickname is already taken!", "danger")
            return redirect(url_for("register"))
        else:
            pw_hashed = sha256(pw.encode()).hexdigest()
            #print(pw_hashed)
            cur.execute('INSERT INTO User(Name, Mail, password, is_superuser) VALUES (%s, %s, %s, %s)', (username, mail, pw_hashed, 0,))
            mysql_db.commit()
            cur.close()
            flash("Successfully registered!", "success")
            return redirect(url_for("homepage"))
    elif request.method == 'POST':
        flash("Fill Out!", "danger")
        return redirect(url_for("register"))
    return render_template("register.html")

@app.route("/login", methods=['GET', 'POST'])
def login():
    if 'id' in session:
        flash("You're already logged in!", "warning")
        return redirect("/")

    if request.method == 'POST' and 'mail' in request.form and 'pw' in request.form:
        mail = request.form['mail']
        pw = request.form['pw']
        pw = sha256(pw.encode()).hexdigest()

        cur = mysql_db.cursor()
        cur.execute("SELECT * FROM User WHERE mail = %s AND password = %s", (mail, pw,))
        account = cur.fetchone()
        cur.close()
        
        if account:
            session['loggedin'] = True
            session['id'] = account[0]
            session['username'] = account[1]
            flash("Successfully Logged In. Welcome back {}".format(session['username']), "success ")
            return redirect(url_for("homepage"))
        else:
            flash("Incorrect mail or password!", "danger")
            return redirect(url_for("login"))
    return render_template("login.html")

@app.route("/logout")
def logout():
    session['loggedin'] = False
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    
    flash("Successfully logged out!", "success")
    return redirect(url_for('homepage'))

@app.route("/tournament", methods=["GET", "POST"])
def tournament():
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM tournament WHERE share_time != %s", ("now",))
    tours = cur.fetchall()
    cur.close()
    #print(tours)
    return render_template("tournament.html", tours=tours)

@app.route("/add-tour", methods=["GET", "POST"])
def add_tour():
    if not 'id' in session:
        flash("Please login to share post!", "danger")
        return redirect(url_for("login"))

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM game")
    games = cur.fetchall()
    cur.close()

    if request.method == 'POST' and 'game' in request.form and 'desc' in request.form and 'prize' in request.form and 'contact' in request.form and 'title' in request.form:
        if 'username' in session:
            game = request.form['game']
            title = request.form['title']
            desc = request.form['desc']
            prize = request.form['prize']
            contact = request.form['contact']
            userid = session['id']
            sharetime = getTimestampString()
        
            cur = mysql_db.cursor()
            cur.execute("INSERT INTO tournament(contact_info, description, UserID, share_time, game, prize, title) VALUES (%s, %s, %s, %s, %s, %s, %s)", (contact, desc, userid, sharetime, game, prize, title))
            mysql_db.commit()
            cur.close()
            return redirect(url_for("tournament"))
        else:
            flash("Please login to share tournament!", "danger")
            return redirect(url_for("tournament"))
    return render_template("add_tour.html", games=games)

@app.route("/tournaments/<int:tour_key>", methods = ['POST', 'GET'])
def tournament_page(tour_key):

    auth = 0

    if 'username' in session:
        logged_id = session['id']
        cur = mysql_db.cursor()
        cur.execute("SELECT UserID FROM tournament WHERE TournamentID = %s", (tour_key,))
        owner_id = cur.fetchall()[0][0]
        cur.close()

        #print(logged_id)
        #print(owner_id)

        if(logged_id == owner_id):
            auth = 1

    if request.method == 'POST':
        if 'update' in request.form:
            #print(tour_key)
            #print("updated")
            return redirect(url_for('tour_update', key=tour_key))
        elif 'delete' in request.form:
            #print("deleted")
            cur = mysql_db.cursor()
            cur.execute("DELETE FROM tournament WHERE TournamentID = %s", (tour_key,))
            mysql_db.commit()
            cur.close()
            return redirect(url_for('tournament'))
         
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM tournament WHERE TournamentID = %s", (tour_key,))
    tournament = cur.fetchall()
    cur.close()

    return render_template("tournament_page.html", tournament=tournament, auth=auth)

@app.route("/tour-update/<key>", methods=["GET", "POST"])
def tour_update(key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST':
        if not request.form:
            return redirect(url_for("tournament"))
        if 'username' in session:
            if 'game' in request.form:
                if request.form['game']:
                    new_name = request.form['game']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE tournament SET game = %s WHERE TournamentID = %s", (new_name, key))
                    mysql_db.commit()
                    cur.close()
            if 'title' in request.form:
                if request.form['title']:
                    new_title = request.form['title']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE tournament SET title = %s WHERE TournamentID = %s", (new_title, key))
                    mysql_db.commit()
                    cur.close()
            if 'contact' in request.form:
                if request.form['contact']:
                    new_contact = request.form['contact']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE tournament SET contact_info = %s WHERE TournamentID = %s", (new_contact, key))
                    mysql_db.commit()
                    cur.close()
            if 'desc' in request.form:
                if request.form['desc']:
                    new_desc = request.form['desc']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE tournament SET desc = %s WHERE TournamentID = %s", (new_desc, key))
                    mysql_db.commit()
                    cur.close()
            if 'prize' in request.form:
                if request.form['prize']:
                    new_prize = request.form['prize']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE tournament SET prize = %s WHERE TournamentID = %s", (new_prize, key))
                    mysql_db.commit()
                    cur.close()          
            return redirect(url_for('tournament'))
        else:
            flash("Please login!", "danger")
            return redirect(url_for("tournament"))
    return render_template("update_tour.html", games=games)

@app.route("/post-update/<key>", methods=["GET", "POST"])
def post_update(key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST' and 'game' in request.form:
        new_game = request.form['game']
        cur = mysql_db.cursor()
        cur.execute("UPDATE post SET game = %s WHERE PostID = %s", (new_game, key))
        mysql_db.commit()
        return render_template("update_post.html", game=new_game)

    if request.method == 'POST':
        if not request.form:
            return redirect(url_for("players"))
        if 'username' in session:
            if 'name' in request.form:
                if request.form['name']:
                    new_name = request.form['name']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET nickname = %s WHERE PostID = %s", (new_name, key))
                    mysql_db.commit()
                    cur.close()
            if 'country' in request.form:
                if request.form['country']:
                    new_country = request.form['country']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET country = %s WHERE PostID = %s", (new_country, key))
                    mysql_db.commit()
                    cur.close()
            if 'contact' in request.form:
                if request.form['contact']:
                    new_contact = request.form['contact']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET contact_info = %s WHERE PostID = %s", (new_contact, key))
                    mysql_db.commit()
                    cur.close()
            if 'rank' in request.form:
                if request.form['rank']:
                    new_rank = request.form['rank']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET ranks = %s WHERE PostID = %s", (new_rank, key))
                    mysql_db.commit()
                    cur.close()
            if 'age' in request.form:
                if request.form['age']:
                    new_age = request.form['age']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET age = %s WHERE PostID = %s", (new_age, key))
                    mysql_db.commit()
                    cur.close()
            if  'hours' in request.form:
                if request.form['hours']:
                    new_hours = request.form['hours']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET hours_played = %s WHERE PostID = %s", (new_hours, key))
                    mysql_db.commit()
                    cur.close()
            if 'desc' in request.form:
                if request.form['desc']:
                    new_desc = request.form['desc']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET description = %s WHERE PostID = %s", (new_desc, key))
                    mysql_db.commit()
                    cur.close()
            if 'require' in request.form:
                if request.form['require']:
                    new_require = request.form['require']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET requirements = %s WHERE PostID = %s", (new_require, key))
                    mysql_db.commit()
                    cur.close()
            if 'act' in request.form:
                if request.form['act']:
                    new_active = request.form['act']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET activeness = %s WHERE PostID = %s", (new_active, key))
                    mysql_db.commit()
                    cur.close()
            if 'cs' in request.form:
                if request.form['cs']: 
                    roles = request.form.getlist('cs')
                    cur = mysql_db.cursor()
                    cur.execute("DELETE FROM role WHERE PostID = %s", (key,))
                    mysql_db.commit()
                    cur.close()        
                    for i in roles:
                        cur = mysql_db.cursor()
                        cur.execute("INSERT INTO role(PostID, roles) VALUES (%s, %s)", (key, i))
                        mysql_db.commit()
                        cur.close()           
            return redirect(url_for('players'))
        else:
            flash("Please login!", "danger")
            return redirect(url_for("players"))
    return render_template("choose_game.html", games=games)

@app.route("/team-update/<key>", methods=["GET", "POST"])
def team_update(key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST' and 'game' in request.form:
        new_game = request.form['game']
        cur = mysql_db.cursor()
        cur.execute("UPDATE post SET game = %s WHERE PostID = %s", (new_game, key))
        mysql_db.commit()
        return render_template("update_team.html", game=new_game)

    if request.method == 'POST':
        if not request.form:
            return redirect(url_for("teams"))
        if 'username' in session:
            if 'name' in request.form:
                if request.form['name']:
                    new_name = request.form['name']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET nickname = %s WHERE PostID = %s", (new_name, key))
                    mysql_db.commit()
                    cur.close()
            if 'country' in request.form:
                if request.form['country']:
                    new_country = request.form['country']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET country = %s WHERE PostID = %s", (new_country, key))
                    mysql_db.commit()
                    cur.close()
            if 'contact' in request.form:
                if request.form['contact']:
                    new_contact = request.form['contact']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET contact_info = %s WHERE PostID = %s", (new_contact, key))
                    mysql_db.commit()
                    cur.close()
            if 'rank' in request.form:
                if request.form['rank']:
                    new_rank = request.form['rank']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET ranks = %s WHERE PostID = %s", (new_rank, key))
                    mysql_db.commit()
                    cur.close()
            if 'desc' in request.form:
                if request.form['desc']:
                    new_desc = request.form['desc']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET description = %s WHERE PostID = %s", (new_desc, key))
                    mysql_db.commit()
                    cur.close()
            if 'require' in request.form:
                if request.form['require']:
                    new_require = request.form['require']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE post SET requirements = %s WHERE PostID = %s", (new_require, key))
                    mysql_db.commit()
                    cur.close()
            if 'cs' in request.form:
                if request.form['cs']: 
                    roles = request.form.getlist('cs')
                    cur = mysql_db.cursor()
                    cur.execute("DELETE FROM role WHERE PostID = %s", (key,))
                    mysql_db.commit()
                    cur.close()        
                    for i in roles:
                        cur = mysql_db.cursor()
                        cur.execute("INSERT INTO role(PostID, roles) VALUES (%s, %s)", (key, i))
                        mysql_db.commit()
                        cur.close()           
            return redirect(url_for('teams'))
        else:
            flash("Please login!", "danger")
            return redirect(url_for("teams"))
    return render_template("choose_game.html", games=games)

@app.route("/teams/<int:team_key>", methods=["GET", "POST"])
def team_page(team_key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM post WHERE PostID = %s", (team_key,))
    team = cur.fetchall()
    cur.close()

    auth = 0

    if 'username' in session:
        logged_id = session['id']
        cur = mysql_db.cursor()
        cur.execute("SELECT UserID FROM post WHERE PostID = %s", (team_key,))
        owner_id = cur.fetchall()[0][0]
        cur.close()

        if(logged_id == owner_id):
            auth = 1
    
    if request.method == 'POST':
        if 'update' in request.form:
            #print(team_key)
            #print("updated")
            return redirect(url_for('team_update', key=team_key))           
        elif 'delete' in request.form:
            #print("deleted")
            cur = mysql_db.cursor()
            cur.execute("DELETE FROM post WHERE PostID = %s", (team_key,))
            mysql_db.commit()
            cur.close()
            return redirect(url_for("teams"))

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM role WHERE PostID = %s", (team_key,))
    roles = cur.fetchall()
    cur.close()
    #print(player)
    return render_template("team_page.html", team=team, roles=roles, auth=auth)


@app.route("/teams", methods=["GET", "POST"])
def teams():
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM role")
    roles = cur.fetchall()
    cur.close()

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM game")
    games = cur.fetchall()
    cur.close()

    cur = mysql_db.cursor()
    cur.execute("SELECT COUNT(*) FROM post WHERE post_type = %s", (1,))
    number_of_teams = cur.fetchall()
    cur.close()
    #print(number_of_teams)
    select_statement = "SELECT * FROM post"
    tup = tuple()
    li = list(tup)
    flag = False
    flag2 = False

    keywords = list()

    if request.method == 'POST':
        flag3 = True
        if 'role' in request.form:
            flag3 = False
            flag = True
            select_statement = "SELECT post.* FROM post INNER JOIN role ON post.PostID=role.PostID"
            role = request.form['role']
            keywords.append(role)
            select_statement += " AND role.roles = %s"
            li.append(role)
        if 'game' in request.form:
            flag3 = False
            game = request.form['game']
            keywords.append(game)
            if flag:
                select_statement += " AND post.game = %s"
            else:
                select_statement += " WHERE game = %s"
                flag2 = True      
            li.append(game)
        if 'rank' in request.form:
            flag3 = False
            rank = request.form['rank']
            keywords.append(rank)
            if flag:
                select_statement += " AND post.ranks = %s"
            if not flag:
                if flag2:
                    select_statement += " AND ranks = %s"
                else:
                    select_statement += " WHERE ranks = %s"
                    flag2 = True
            li.append(rank)
        if 'country' in request.form:
            flag3 = False
            country = request.form['country']
            keywords.append(country)
            if flag:
                select_statement += " AND post.country = %s"
            if not flag:
                if flag2:
                    select_statement += " AND country = %s"
                else:
                    select_statement += " WHERE country = %s"
                    flag2 = True
            li.append(country)

        if flag:
            select_statement += " AND post.post_type = %s"
        else:
            if flag2:
                select_statement += " AND post_type = %s"
            else:
                select_statement += " WHERE post_type = %s"
        
        li.append(1)

        if not flag3:   
            tup = tuple(li)
            cur = mysql_db.cursor()
            cur.execute(select_statement, li)
            players = cur.fetchall()
            #print(players)
            cur.close()
            return render_template("teams.html", players=players, roles=roles, games=games, keywords=keywords, number_of_teams=number_of_teams)
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM post WHERE post_type = 1")
    players = cur.fetchall()
    cur.close()  
    return render_template("teams.html", players=players, roles=roles, games=games, keywords=keywords, number_of_teams=number_of_teams)

@app.route("/add-team", methods=["GET", "POST"])
def add_team():
    if not 'id' in session:
        flash("Please login to share post!", "danger")
        return redirect(url_for("login"))

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST' and 'game' in request.form:
        game = request.form['game']
        session['game'] = game
        return render_template("add_team.html", game=game)

    if request.method == 'POST' and 'name' in request.form and 'country' in request.form and 'contact' in request.form and 'rank' in request.form and 'desc' in request.form and 'require' in request.form and 'cs' in request.form:
        if 'username' in session:
            name = request.form['name']
            country = request.form['country']
            contact = request.form['contact']
            rank = request.form['rank']
            desc = request.form['desc']
            require = request.form['require']
            userid = session['id']
            game = session['game']
            roles = request.form.getlist('cs')
            share_time = getTimestampString()
            
            cur = mysql_db.cursor()
            cur.execute("INSERT INTO post(UserID, country, contact_info, ranks, age, hours_played, description, nickname, requirements, post_type, game, activeness, shared_time) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (userid, country, contact, rank, 0, 0, desc, name, require, 1, game, 0, share_time))
            mysql_db.commit()
            cur.close()

            last = cur.lastrowid 
            #print(cur.lastrowid)
            for i in roles:
                cur = mysql_db.cursor()
                cur.execute("INSERT INTO role(PostID, roles) VALUES (%s, %s)", (last, i))
                mysql_db.commit()
                cur.close()           
            return redirect(url_for("teams"))
        else:
            flash("Please login!", "danger")
            return redirect(url_for("add_player"))
    return render_template("choose_game.html", games=games)

@app.route("/players", methods=["GET", "POST"])
def players():
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM role")
    roles = cur.fetchall()
    cur.close()
    #print(roles)

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM game")
    games = cur.fetchall()
    cur.close()
    #print(roles)

    cur = mysql_db.cursor()
    cur.execute("SELECT COUNT(*) FROM post WHERE post_type = %s", (0,))
    number_of_players = cur.fetchall()
    cur.close()
    #print(number_of_players)
    select_statement = "SELECT * FROM post"
    tup = tuple()
    li = list(tup)
    flag = False
    flag2 = False

    keywords = list()

    if request.method == 'POST':
        flag3 = True
        if 'role' in request.form:
            flag3 = False
            flag = True
            select_statement = "SELECT post.* FROM post INNER JOIN role ON post.PostID=role.PostID"
            role = request.form['role']
            keywords.append(role)
            select_statement += " AND role.roles = %s"
            li.append(role)
        if 'game' in request.form:
            flag3 = False
            game = request.form['game']
            keywords.append(game)
            if flag:
                select_statement += " AND post.game = %s"
            else:
                select_statement += " WHERE game = %s"
                flag2 = True      
            li.append(game)
        if 'rank' in request.form:
            flag3 = False
            rank = request.form['rank']
            keywords.append(rank)
            if flag:
                select_statement += " AND post.ranks = %s"
            if not flag:
                if flag2:
                    select_statement += " AND ranks = %s"
                else:
                    select_statement += " WHERE ranks = %s"
                    flag2 = True
            li.append(rank)
        if 'country' in request.form:
            flag3 = False
            country = request.form['country']
            keywords.append(country)
            if flag:
                select_statement += " AND post.country = %s"
            if not flag:
                if flag2:
                    select_statement += " AND country = %s"
                else:
                    select_statement += " WHERE country = %s"
                    flag2 = True
            li.append(country)
        
        if flag:
            select_statement += " AND post.post_type = %s"
        else:
            if flag2:
                select_statement += " AND post_type = %s"
            else:
                select_statement += " WHERE post_type = %s"
        
        li.append(0)
        
        if 'hours' in request.form:
            hours = request.form['hours']
            if hours:
                flag3 = False               
                keywords.append(hours)
                select_statement += " GROUP BY post.hours_played HAVING post.hours_played > %s"
                li.append(hours)

        if not flag3:   
            tup = tuple(li)
            #print(keywords)
            cur = mysql_db.cursor()
            cur.execute(select_statement, li)
            players = cur.fetchall()
            #print(players)
            cur.close()
            return render_template("players.html", players=players, roles=roles, games=games, keywords=keywords, number_of_players=number_of_players)
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM post WHERE post_type = 0")
    players = cur.fetchall()
    cur.close()  
    return render_template("players.html", players=players, roles=roles, games=games, keywords=keywords, number_of_players=number_of_players)

@app.route("/players/<int:player_key>", methods=["GET", "POST"])
def player_page(player_key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM post WHERE PostID = %s", (player_key,))
    player = cur.fetchall()
    cur.close()

    auth = 0

    if 'username' in session:
        logged_id = session['id']
        cur = mysql_db.cursor()
        cur.execute("SELECT UserID FROM post WHERE PostID = %s", (player_key,))
        owner_id = cur.fetchall()[0][0]
        cur.close()

        #print(logged_id)
        #print(owner_id)

        if(logged_id == owner_id):
            auth = 1
    
    if request.method == 'POST':
        if 'update' in request.form:
            #print(player_key)
            return redirect(url_for('post_update', key=player_key))
            #print("updated")
        elif 'delete' in request.form:
            #print("deleted")
            cur = mysql_db.cursor()
            cur.execute("DELETE FROM post WHERE PostID = %s", (player_key,))
            mysql_db.commit()
            cur.close()
            return redirect(url_for('players'))

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM role WHERE PostID = %s", (player_key,))
    roles = cur.fetchall()
    cur.close()
    #print(player)
    return render_template("player_page.html", player=player, roles=roles, auth=auth)


@app.route("/add-player", methods=["GET", "POST"])
def add_player():
    if not 'id' in session:
        flash("Please login to share post!", "danger")
        return redirect(url_for("login"))

    game = ""

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST' and 'game' in request.form:
        game = request.form['game']
        session['game'] = game
        return render_template("add_player.html", game=game)

    if request.method == 'POST' and 'name' in request.form and 'country' in request.form and 'contact' in request.form and 'rank' in request.form and 'age' in request.form and 'hours' in request.form and 'desc' in request.form and 'require' in request.form:
        if 'username' in session:
            name = request.form['name']
            country = request.form['country']
            contact = request.form['contact']
            rank = request.form['rank']
            age = request.form['age']
            hours = request.form['hours']
            desc = request.form['desc']
            require = request.form['require']
            userid = session['id']
            game = session['game']
            active = request.form['act']
            #print(active)
            roles = request.form.getlist('cs')
            share_time = getTimestampString()
            
            cur = mysql_db.cursor()
            cur.execute("INSERT INTO post(UserID, country, contact_info, ranks, age, hours_played, description, nickname, requirements, post_type, game, activeness, shared_time) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (userid, country, contact, rank, age, hours, desc, name, require, 0, game, active, share_time))
            mysql_db.commit()
            cur.close()

            last = cur.lastrowid 
            #print(cur.lastrowid)
            for i in roles:
                cur = mysql_db.cursor()
                cur.execute("INSERT INTO role(PostID, roles) VALUES (%s, %s)", (last, i))
                mysql_db.commit()
                cur.close()           
            return redirect('players')
        else:
            flash("Please login!", "danger")
            return redirect(url_for("add_player"))
    return render_template("choose_game.html", games=games)

@app.route("/forum", methods=["GET", "POST"])
def forum():
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Discussion")
    topics = cur.fetchall()
    cur.close()
    #print(topics)
    return render_template("forum.html", topics=topics)

@app.route("/add-disc", methods=["GET", "POST"])
def add_disc():
    if not 'id' in session:
        flash("Please login to share post!", "danger")
        return redirect(url_for("login"))

    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST' and 'title' in request.form and 'content' in request.form and 'game' in request.form:
        if 'username' in session:
            title = request.form['title']
            content = request.form['content']
            game = request.form['game']
            userid = session['id']
            sharetime = getTimestampString()
        
            cur = mysql_db.cursor()
            cur.execute("INSERT INTO discussion(title, content, UserID, share_time, game) VALUES (%s, %s, %s, %s, %s)", (title, content, userid, sharetime, game))
            mysql_db.commit()
            cur.close()
            flash("You've shared a post!", "success")
            return redirect(url_for("forum"))
        else:
            flash("Please login", "danger")
            return redirect(url_for("login"))
    return render_template("add_discussion.html", games=games)

@app.route("/topic/<int:topic_key>", methods=["GET", "POST"])
def disc_page(topic_key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM discussion WHERE DiscussionId = %s", (topic_key,))
    topic = cur.fetchall()
    cur.close()
    #print(topic)
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM response WHERE DiscussionId = %s", (topic_key,))
    responses = cur.fetchall()
    #print(responses)
    cur.close()

    cur = mysql_db.cursor()
    cur.execute("SELECT UserID FROM response WHERE DiscussionId = %s", (topic_key,))
    user_ids = cur.fetchall()
    #print(user_ids)
    cur.close()

    users = list()

    for i in user_ids:
        cur = mysql_db.cursor()
        cur.execute("SELECT Name FROM User WHERE UserID = %s", (i[0],))
        user = cur.fetchall()
        users.append(user[0][0])
        cur.close()

    gen = list()
    for i in range(len(users)):
        z = list(responses[i])
        gen.append(z)

    for i in range(len(users)):
        gen[i][3] = users[i]


    if request.method == 'POST' and 'response' in request.form:
        if 'username' in session:
            response = request.form['response']
            disc_id = topic[0][0]
            userid = session['id']
            sharetime = getTimestampString()
        
            cur = mysql_db.cursor()
            cur.execute("INSERT INTO response(DiscussionID, response, UserID, share_time) VALUES (%s, %s, %s, %s)", (disc_id, response, userid, sharetime))
            mysql_db.commit()
            cur.close()
            return redirect('/topic/{}'.format(topic_key))
        else:
            flash("Please Log In", "danger")
            return redirect(url_for("login"))

    auth = 0

    if 'username' in session:
        logged_id = session['id']
        cur = mysql_db.cursor()
        cur.execute("SELECT UserID FROM discussion WHERE DiscussionID = %s", (topic_key,))
        owner_id = cur.fetchall()[0][0]
        cur.close()

        if(logged_id == owner_id):
            auth = 1
    
    if request.method == 'POST':
        if 'update' in request.form:
            return redirect(url_for('disc_update', key=topic_key))
        elif 'delete' in request.form:
            cur = mysql_db.cursor()
            cur.execute("DELETE FROM discussion WHERE DiscussionID = %s", (topic_key,))
            mysql_db.commit()
            cur.close()
            return redirect(url_for('forum'))

    return render_template("disc_page.html", topic=topic, responses=gen, auth=auth)

@app.route("/disc-update/<key>", methods=["GET", "POST"])
def disc_update(key):
    cur = mysql_db.cursor()
    cur.execute("SELECT * FROM Game")
    games = cur.fetchall()
    #print(games)
    cur.close()

    if request.method == 'POST':
        if not request.form:
            return redirect(url_for("forum"))
        if 'username' in session:
            if 'game' in request.form:
                if request.form['game']:
                    new_game = request.form['game']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE discussion SET game = %s WHERE DiscussionID = %s", (new_game, key))
                    mysql_db.commit()
                    cur.close()
            if 'title' in request.form:
                if request.form['title']:
                    new_title = request.form['title']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE discussion SET title = %s WHERE DiscussionID = %s", (new_title, key))
                    mysql_db.commit()
                    cur.close()
            if 'content' in request.form:
                if request.form['content']:
                    new_content = request.form['content']
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE discussion SET content = %s WHERE DiscussionID = %s", (new_content, key))
                    mysql_db.commit()
                    cur.close()
            if 'stat' in request.form:
                if request.form['stat']:
                    new_status = "Closed"
                    cur = mysql_db.cursor()
                    cur.execute("UPDATE discussion SET stat = %s WHERE DiscussionID = %s", (new_status, key))
                    mysql_db.commit()
                    cur.close()
            return redirect(url_for('forum'))
        else:
            flash("Please login!", "danger")
            return redirect(url_for("forum"))
    return render_template("update_disc.html", games=games)



app.run(host="127.0.0.1", port="8080", debug=True)
