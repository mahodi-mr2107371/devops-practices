# Log Archive Tool

A simple command-line utility for archiving log directories by compressing them into timestamped `.tar.gz` files. This helps keep systems clean while preserving historical logs for future reference.

## Features

- Archive any log directory from the command line
- Compress logs into `.tar.gz` format
- Store archives in a dedicated directory
- Generate unique archive names using timestamps
- Record archive activity in a log file
- Easy to automate with cron jobs

## Requirements

- Linux/macOS or any Unix-like operating system
- Bash shell
- `tar` utility installed

## Installation

1. Clone or download the project.

2. Create the script file:

   ```bash
   touch log-archive
   ```

3. Paste the script contents into `log-archive`.

4. Make the script executable:

   ```bash
   chmod +x log-archive
   ```

## Usage

Run the tool and provide the log directory as an argument:

```bash
./log-archive <log-directory>
```

### Example

Archive the system logs directory:

```bash
./log-archive /var/log
```

Example output:

```text
Archive created: ./archives/logs_archive_20240816_100648.tar.gz
```

## Project Structure

After running the tool, the project structure will look like:

```text
.
├── log-archive
├── archive.log
└── archives
    └── logs_archive_20240816_100648.tar.gz
```

## Archive Naming Convention

Archives are created using the following format:

```text
logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

Example:

```text
logs_archive_20240816_100648.tar.gz
```

## Logging

Every successful archive operation is recorded in `archive.log`.

Example:

```text
2024-08-16 10:06:48 - Archived /var/log -> ./archives/logs_archive_20240816_100648.tar.gz
```

## Error Handling

The script validates:

- A log directory argument is provided
- The specified directory exists
- The archive is successfully created

If an error occurs, an appropriate message is displayed and the script exits.

## Automation with Cron

To run the archive automatically every day at 2:00 AM:

Open your crontab:

```bash
crontab -e
```

Add the following entry:

```cron
0 2 * * * /path/to/log-archive /var/log
```

Replace `/path/to/log-archive` with the full path to your script.

## Future Improvements

Possible enhancements include:

- Automatically remove logs after archiving
- Archive only logs older than a specified number of days
- Send email notifications after successful archives
- Upload archives to a remote server
- Upload archives to cloud storage services (AWS S3, Google Cloud Storage, Azure Blob Storage)
- Add configurable archive destinations
- Add archive retention policies

## License

This project is open source and available under the MIT License.