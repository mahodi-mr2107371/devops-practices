# Server Performance Stats

A Bash script that analyzes basic server performance statistics including:

* Total CPU usage
* Memory usage (used/free and percentage)
* Disk usage (used/free and percentage)
* Top 5 processes by CPU usage
* Top 5 processes by memory usage
* System information (hostname, uptime, load average)

## Project URL

https://github.com/mahodi-mr2107371/devops-server-state

## Usage

Make the script executable:

```bash
chmod +x server-stats.sh
```

Run the script:

```bash
./server-stats.sh
```

## Example Output

```text
=========================================
       Linux Server Performance Stats
=========================================

CPU Usage:
  Total CPU Usage: 23%

Memory Usage:
  Total: 7850 MB
  Used : 3210 MB (40.89%)
  Free : 4640 MB

Disk Usage:
  Total: 100G
  Used : 45G (45%)
  Free : 55G
```

## Technologies Used

* Bash
* Linux system utilities (`top`, `free`, `df`, `ps`, `uptime`)
