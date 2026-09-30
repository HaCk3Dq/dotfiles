#!/usr/bin/python

import csv
from collections import defaultdict
from datetime import datetime
from pathlib import Path

LOG_FILE = Path.home() / ".local/share/nvim/pendulum-log.csv"
TIME_FORMAT = "%Y-%m-%d %H:%M:%S"


def format_duration(seconds: float) -> str:
    seconds = round(seconds)
    hours, seconds = divmod(seconds, 3600)
    minutes, seconds = divmod(seconds, 60)

    if hours:
        return f"{hours}h {minutes:02}m"
    if minutes:
        return f"{minutes}m {seconds:02}s"
    return f"{seconds}s"


def project_totals() -> dict[str, float]:
    totals: dict[str, float] = defaultdict(float)
    previous_project: str | None = None
    previous_timestamp: datetime | None = None

    with LOG_FILE.open(newline="") as log:
        for row in csv.DictReader(log):
            try:
                project = row["project"]
                timestamp = datetime.strptime(row["time"], TIME_FORMAT)
            except (KeyError, TypeError, ValueError):
                continue

            totals.setdefault(project, 0.0)
            if project == previous_project and previous_timestamp is not None:
                elapsed = (timestamp - previous_timestamp).total_seconds()
                if elapsed >= 0:
                    totals[project] += elapsed

            previous_project = project
            previous_timestamp = timestamp

    return totals


def main() -> None:
    try:
        totals = project_totals()
    except FileNotFoundError:
        raise SystemExit(f"Pendulum log not found: {LOG_FILE}")

    if not totals:
        print("No tracked project time yet.")
        return

    width = max(len(project) for project in totals)
    for project, seconds in sorted(
        totals.items(), key=lambda item: (-item[1], item[0])
    ):
        print(f"{project:<{width}}  {format_duration(seconds):>8}")


if __name__ == "__main__":
    main()
