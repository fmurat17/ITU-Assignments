- init:
    run: rm -f assignment1
    blocker: true

- build:
    run: gcc -std=c99 -Wall -Werror assignment1.c -o assignment1  # timeout: 2
    blocker: true

- case_2000_1_1_2078:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2078"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2078: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_2_2089:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2089"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2089: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_3_2107:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2107"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2107: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_4_2054:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2054"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2054: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_5_2140:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2140"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2140: 20\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_6_2072:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2072"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2072: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_7_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_8_2104:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2104"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2104: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_9_2142:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2142"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2142: 20\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_10_2071:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2071"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2071: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_11_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_12_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_13_2142:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2142"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2142: 20\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_14_2069:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2069"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2069: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_15_2074:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2074"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2074: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_16_2124:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2124"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2124: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_17_2121:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2121"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2121: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_18_2033:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2033"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2033: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_19_2019:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2019"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2019: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_20_2058:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2058"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2058: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_21_2073:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2073"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2073: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_22_2105:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2105"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2105: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_23_2105:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2105"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2105: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_24_2084:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2084"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2084: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_25_2029:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2029"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2029: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_26_2093:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2093"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2093: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_27_2002:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2002"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2002: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_28_2002:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2002"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2002: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_29_2093:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2093"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2093: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_30_2016:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2016"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2016: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_1_31_2133:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 1 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2133"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2133: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_1_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_2_2061:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2061"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2061: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_3_2049:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2049"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2049: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_4_2034:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2034"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2034: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_5_2054:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2054"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2054: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_6_2121:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2121"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2121: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_7_2060:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2060"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2060: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_8_2115:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2115"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2115: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_9_2072:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2072"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2072: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_10_2088:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2088"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2088: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_11_2139:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2139"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2139: 20\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_12_2096:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2096"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2096: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_13_2083:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2083"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2083: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_14_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_15_2126:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2126"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2126: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_16_2016:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2016"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2016: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_17_2139:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2139"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2139: 20\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_18_2012:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2012"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2012: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_19_2035:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2035"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2035: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_20_2050:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2050"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2050: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_21_2042:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2042"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2042: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_22_2097:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2097"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2097: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_23_2111:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2111"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2111: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_24_2082:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2082"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2082: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_25_2126:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2126"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2126: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_26_2057:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2057"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2057: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_27_2041:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2041"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2041: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_28_2129:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2129"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2129: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_2_29_2106:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 2 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2106"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2106: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_1_2013:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2013"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2013: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_2_2071:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2071"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2071: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_3_2130:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2130"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2130: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_4_2031:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2031"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2031: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_5_2121:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2121"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2121: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_6_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_7_2085:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2085"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2085: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_8_2051:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2051"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2051: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_9_2034:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2034"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2034: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_10_2009:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2009"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2009: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_11_2080:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2080"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2080: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_12_2122:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2122"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2122: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_13_2104:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2104"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2104: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_14_2132:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2132"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2132: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_15_2014:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2014"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2014: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_16_2122:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2122"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2122: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_17_2112:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2112"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2112: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_18_2030:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2030"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2030: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_19_2070:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2070"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2070: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_20_2080:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2080"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2080: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_21_2065:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2065"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2065: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_22_2076:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2076"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2076: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_23_2078:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2078"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2078: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_24_2015:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2015"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2015: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_25_2040:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2040"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2040: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_26_2014:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2014"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2014: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_27_2098:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2098"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2098: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_28_2054:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2054"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2054: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_29_2011:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2011"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2011: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_30_2036:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2036"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2036: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_3_31_2013:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 3 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2013"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2013: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_1_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_2_2107:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2107"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2107: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_3_2144:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2144"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2144: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_4_2055:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2055"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2055: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_5_2037:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2037"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2037: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_6_2117:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2117"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2117: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_7_2097:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2097"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2097: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_8_2045:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2045"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2045: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_9_2107:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2107"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2107: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_10_2062:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2062"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2062: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_11_2125:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2125"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2125: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_12_2038:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2038"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2038: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_13_2020:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2020"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2020: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_14_2066:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2066"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2066: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_15_2052:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2052"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2052: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_16_2142:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2142"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2142: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_17_2031:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2031"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2031: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_18_2038:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2038"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2038: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_19_2065:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2065"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2065: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_20_2068:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2068"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2068: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_21_2104:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2104"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2104: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_22_2141:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2141"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2141: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_23_2102:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2102"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2102: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_24_2075:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2075"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2075: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_25_2137:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2137"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2137: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_26_2072:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2072"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2072: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_27_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_28_2044:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2044"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2044: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_29_2083:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2083"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2083: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_4_30_2062:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 4 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2062"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2062: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_1_2058:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2058"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2058: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_2_2064:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2064"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2064: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_3_2126:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2126"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2126: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_4_2011:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2011"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2011: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_5_2075:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2075"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2075: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_6_2016:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2016"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2016: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_7_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_8_2025:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2025"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2025: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_9_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_10_2045:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2045"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2045: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_11_2088:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2088"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2088: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_12_2098:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2098"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2098: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_13_2083:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2083"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2083: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_14_2108:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2108"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2108: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_15_2018:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2018"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2018: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_16_2136:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2136"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2136: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_17_2059:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2059"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2059: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_18_2005:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2005"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2005: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_19_2027:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2027"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2027: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_20_2080:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2080"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2080: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_21_2029:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2029"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2029: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_22_2087:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2087"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2087: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_23_2030:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2030"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2030: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_24_2132:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2132"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2132: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_25_2119:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2119"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2119: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_26_2020:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2020"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2020: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_27_2057:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2057"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2057: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_28_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_29_2065:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2065"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2065: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_30_2141:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2141"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2141: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_5_31_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 5 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_1_2123:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2123"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2123: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_2_2014:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2014"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2014: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_3_2143:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2143"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2143: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_4_2090:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2090"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2090: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_5_2089:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2089"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2089: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_6_2115:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2115"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2115: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_7_2071:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2071"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2071: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_8_2115:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2115"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2115: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_9_2089:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2089"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2089: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_10_2072:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2072"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2072: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_11_2012:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2012"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2012: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_12_2040:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2040"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2040: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_13_2009:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2009"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2009: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_14_2076:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2076"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2076: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_15_2014:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2014"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2014: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_16_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_17_2091:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2091"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2091: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_18_2020:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2020"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2020: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_19_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_20_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_21_2049:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2049"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2049: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_22_2025:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2025"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2025: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_23_2010:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2010"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2010: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_24_2137:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2137"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2137: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_25_2144:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2144"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2144: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_26_2030:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2030"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2030: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_27_2048:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2048"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2048: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_28_2098:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2098"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2098: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_29_2051:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2051"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2051: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_6_30_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 6 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_1_2115:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2115"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2115: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_2_2130:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2130"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2130: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_3_2012:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2012"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2012: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_4_2067:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2067"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2067: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_5_2073:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2073"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2073: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_6_2057:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2057"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2057: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_7_2139:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2139"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2139: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_8_2101:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2101"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2101: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_9_2025:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2025"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2025: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_10_2081:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2081"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2081: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_11_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_12_2140:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2140"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2140: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_13_2121:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2121"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2121: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_14_2035:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2035"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2035: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_15_2025:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2025"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2025: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_16_2136:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2136"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2136: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_17_2136:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2136"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2136: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_18_2116:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2116"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2116: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_19_2112:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2112"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2112: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_20_2074:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2074"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2074: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_21_2096:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2096"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2096: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_22_2117:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2117"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2117: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_23_2099:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2099"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2099: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_24_2106:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2106"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2106: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_25_2108:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2108"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2108: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_26_2096:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2096"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2096: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_27_2137:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2137"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2137: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_28_2112:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2112"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2112: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_29_2047:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2047"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2047: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_30_2041:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2041"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2041: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_7_31_2066:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 7 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2066"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2066: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_1_2119:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2119"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2119: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_2_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_3_2078:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2078"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2078: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_4_2039:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2039"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2039: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_5_2054:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2054"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2054: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_6_2135:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2135"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2135: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_7_2031:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2031"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2031: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_8_2008:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2008"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2008: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_9_2117:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2117"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2117: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_10_2112:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2112"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2112: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_11_2138:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2138"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2138: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_12_2066:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2066"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2066: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_13_2043:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2043"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2043: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_14_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_15_2092:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2092"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2092: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_16_2135:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2135"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2135: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_17_2119:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2119"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2119: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_18_2061:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2061"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2061: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_19_2100:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2100"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2100: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_20_2046:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2046"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2046: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_21_2011:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2011"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2011: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_22_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_23_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_24_2117:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2117"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2117: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_25_2090:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2090"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2090: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_26_2050:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2050"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2050: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_27_2063:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2063"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2063: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_28_2055:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2055"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2055: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_29_2097:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2097"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2097: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_30_2061:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2061"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2061: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_8_31_2121:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 8 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2121"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2121: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_1_2069:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2069"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2069: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_2_2042:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2042"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2042: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_3_2008:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2008"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2008: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_4_2065:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2065"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2065: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_5_2052:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2052"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2052: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_6_2100:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2100"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2100: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_7_2096:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2096"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2096: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_8_2061:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2061"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2061: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_9_2070:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2070"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2070: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_10_2018:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2018"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2018: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_11_2052:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2052"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2052: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_12_2092:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2092"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2092: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_13_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_14_2034:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2034"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2034: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_15_2037:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2037"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2037: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_16_2005:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2005"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2005: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_17_2006:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2006"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2006: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_18_2055:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2055"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2055: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_19_2061:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2061"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2061: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_20_2008:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2008"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2008: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_21_2022:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2022"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2022: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_22_2087:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2087"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2087: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_23_2006:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2006"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2006: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_24_2139:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2139"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2139: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_25_2031:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2031"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2031: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_26_2056:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2056"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2056: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_27_2012:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2012"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2012: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_28_2042:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2042"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2042: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_29_2110:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2110"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2110: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_9_30_2073:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 9 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2073"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2073: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_1_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_2_2135:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2135"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2135: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_3_2071:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2071"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2071: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_4_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_5_2053:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2053"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2053: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_6_2123:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2123"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2123: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_7_2081:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2081"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2081: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_8_2003:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2003"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2003: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_9_2140:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2140"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2140: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_10_2107:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2107"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2107: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_11_2124:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2124"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2124: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_12_2001:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2001"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2001: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_13_2053:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2053"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2053: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_14_2141:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2141"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2141: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_15_2036:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2036"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2036: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_16_2046:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2046"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2046: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_17_2146:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2146"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2146: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_18_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_19_2101:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2101"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2101: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_20_2016:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2016"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2016: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_21_2007:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2007"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2007: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_22_2123:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2123"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2123: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_23_2103:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2103"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2103: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_24_2013:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2013"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2013: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_25_2072:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2072"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2072: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_26_2090:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2090"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2090: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_27_2026:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2026"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2026: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_28_2084:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2084"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2084: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_29_2089:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2089"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2089: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_30_2136:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2136"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2136: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_10_31_2113:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 10 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2113"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2113: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_1_2062:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2062"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2062: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_2_2124:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2124"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2124: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_3_2140:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2140"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2140: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_4_2043:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2043"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2043: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_5_2134:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2134"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2134: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_6_2116:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2116"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2116: 15\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_7_2125:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2125"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2125: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_8_2137:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2137"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2137: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_9_2110:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2110"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2110: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_10_2041:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2041"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2041: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_11_2070:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2070"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2070: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_12_2067:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2067"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2067: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_13_2094:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2094"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2094: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_14_2064:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2064"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2064: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_15_2103:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2103"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2103: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_16_2141:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2141"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2141: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_17_2019:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2019"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2019: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_18_2102:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2102"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2102: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_19_2051:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2051"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2051: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_20_2035:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2035"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2035: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_21_2065:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2065"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2065: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_22_2028:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2028"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2028: 4\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_23_2094:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2094"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2094: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_24_2034:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2034"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2034: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_25_2100:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2100"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2100: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_26_2141:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2141"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2141: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_27_2060:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2060"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2060: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_28_2140:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2140"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2140: 18\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_29_2083:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2083"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2083: 11\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_11_30_2005:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 11 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2005"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2005: 0\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_1_2062:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 1"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2062"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2062: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_2_2145:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 2"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2145"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2145: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_3_2086:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 3"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2086"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2086: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_4_2055:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 4"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2055"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2055: 7\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_5_2041:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 5"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2041"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2041: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_6_2073:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 6"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2073"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2073: 10\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_7_2024:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 7"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2024"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2024: 3\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_8_2122:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 8"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2122"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2122: 16\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_9_2019:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 9"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2019"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2019: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_10_2090:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 10"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2090"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2090: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_11_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 11"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_12_2089:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 12"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2089"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2089: 12\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_13_2011:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 13"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2011"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2011: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_14_2067:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 14"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2067"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2067: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_15_2109:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 15"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2109"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2109: 14\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_16_2070:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 16"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2070"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2070: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_17_2017:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 17"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2017"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2017: 2\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_18_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 18"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_19_2128:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 19"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2128"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2128: 17\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_20_2069:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 20"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2069"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2069: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_21_2016:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 21"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2016"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2016: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_22_2046:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 22"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2046"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2046: 6\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_23_2097:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 23"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2097"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2097: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_24_2066:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 24"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2066"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2066: 9\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_25_2037:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 25"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2037"
        - expect: "It's a Monday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2037: 5\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_26_2006:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 26"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2006"
        - expect: "It's a Tuesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2006: 1\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_27_2060:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 27"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2060"
        - expect: "It's a Wednesday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2060: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_28_2097:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 28"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2097"
        - expect: "It's a Thursday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2097: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_29_2146:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 29"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2146"
        - expect: "It's a Friday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2146: 19\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_30_2099:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 30"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2099"
        - expect: "It's a Saturday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2099: 13\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0

- case_2000_12_31_2059:
    run: ./assignment1
    points: 1
    script:
        - expect: "Enter date \\[year month day\\]: "  # timeout: 2
        - send: "2000 12 31"
        - expect: "Enter end year: "                   # timeout: 2
        - send: "2059"
        - expect: "It's a Sunday.\r\n"                 # timeout: 2
        - expect: "Same day-and-month on same weekday between 2001 and 2059: 8\r\n"  # timeout: 2
        - expect: _EOF_  # timeout: 2
    exit: 0
