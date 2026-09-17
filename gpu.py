import subprocess

GPU_ICON = "%{T3}󰢮%{T-}"
TEXT_FONT = "%{T1}"
TEMPERATURE_ICON = f"%{{T3}}{TEXT_FONT}"
POWER_ICON = f"%{{T3}}󱐋{TEXT_FONT}"
ALERT_COLOR = "%{F#FF4444}"
RESET_COLOR = "%{F-}"
VRAM_WARN_PERCENT = 90
TEMPERATURE_WARN_C = 80


def nvidia_smi(*arguments: str) -> str:
    return subprocess.check_output(
        ["nvidia-smi", *arguments],
        stderr=subprocess.DEVNULL,
        text=True,
        timeout=2,
    ).strip()


def ollama_has_loaded_models() -> bool:
    output = subprocess.check_output(
        ["ollama", "ps"],
        stderr=subprocess.DEVNULL,
        text=True,
        timeout=2,
    )
    return any(line.strip() for line in output.splitlines()[1:])


def main() -> None:
    try:
        if not ollama_has_loaded_models():
            print()

        stats = nvidia_smi(
            "--query-gpu=memory.used,memory.total,temperature.gpu,power.draw",
            "--format=csv,noheader,nounits",
        ).splitlines()[0]
        memory_mb, memory_total_mb, temperature, power_watts = (
            int(float(value.strip())) for value in stats.split(",")
        )
        memory_gb = memory_mb / 1024
        memory_text = f"{memory_gb:.1f}G"
        temperature_text = f"{temperature}°"

        if memory_mb * 100 >= memory_total_mb * VRAM_WARN_PERCENT:
            memory_text = f"{ALERT_COLOR}{memory_text}{RESET_COLOR}"
        if temperature >= TEMPERATURE_WARN_C:
            temperature_text = f"{ALERT_COLOR}{temperature_text}{RESET_COLOR}"

        print(
            f"{GPU_ICON} {TEXT_FONT} {memory_text}  "
            f"{TEMPERATURE_ICON} {temperature_text} "
            f"{POWER_ICON} {power_watts}W%{{T-}}"
        )
    except (FileNotFoundError, IndexError, ValueError, subprocess.SubprocessError):
        return


if __name__ == "__main__":
    main()
