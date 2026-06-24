# Nginx Log Analyzer

## Overview

This project is a simple Bash script that analyzes an Nginx access log file and displays:

* Top 5 IP addresses with the most requests
* Top 5 most requested paths
* Top 5 response status codes
* Top 5 user agents

The script uses standard Linux command-line utilities such as:

* awk
* sort
* uniq
* head

## Requirements

* Linux/macOS terminal
* Bash shell
* Nginx access log file

## Project Files

```text
.
├── log_analyzer.sh
├── access.log
└── README.md
```

## Usage

Make the script executable:

```bash
chmod +x log_analyzer.sh
```

Run the script:

```bash
./log_analyzer.sh access.log
```

## Example Output

```text
Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests
43.224.43.187 - 30 requests
178.128.94.113 - 20 requests

Top 5 most requested paths:
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests
/api/v1/payments - 30 requests
/api/v1/reviews - 20 requests

Top 5 response status codes:
200 - 1000 requests
404 - 600 requests
500 - 50 requests
401 - 30 requests
304 - 20 requests

Top 5 user agents:
Mozilla/5.0 (...) - 500 requests
curl/7.68.0 - 300 requests
PostmanRuntime/7.29.0 - 200 requests
Python-requests/2.28.1 - 150 requests
Go-http-client/1.1 - 100 requests
```

## How It Works

### Top IP Addresses

Extracts the first field (IP address):

```bash
awk '{print $1}'
```

Counts occurrences:

```bash
sort | uniq -c | sort -rn
```

### Top Requested Paths

Extracts the HTTP request field:

```bash
awk -F'"' '{print $2}'
```

Extracts only the path:

```bash
awk '{print $2}'
```

### Top Status Codes

Extracts the HTTP status code:

```bash
awk '{print $9}'
```

### Top User Agents

Extracts the user-agent string:

```bash
awk -F'"' '{print $6}'
```

## Alternative Solution (Without awk)

Example for counting IP addresses using grep, cut, and sort:

```bash
cut -d' ' -f1 access.log \
| sort \
| uniq -c \
| sort -rn \
| head -5
```

Example for extracting status codes:

```bash
grep -o '" [0-9][0-9][0-9] ' access.log \
| tr -d '"' \
| sort \
| uniq -c \
| sort -rn \
| head -5
```

## Stretch Goal Ideas

* Accept the number of results as a parameter.
* Export results to a file.
* Display percentages.
* Add support for compressed logs (.gz).
* Generate CSV reports.
* Create charts using gnuplot.

## License

This project is for educational purposes.
