import shutil
from pathlib import Path


def get_txt_info(file_path, start_marker=None, end_marker=None):
    if not file_path.exists():
        return ""
    with open(file_path, "r") as f:
        text = f.read()
    if start_marker and end_marker:
        start_idx = text.find(start_marker)
        end_idx = text.find(end_marker, start_idx + len(start_marker))
        if start_idx != -1 and end_idx != -1:
            return text[start_idx + len(start_marker) : end_idx].strip()
        else:
            return ""
    return text


def add_lines_to_typs_doc(file_path, rs_text):
    with open(file_path, "r") as f:
        lines = f.readlines()

    # Find the line with the placeholder
    placeholder = "// INSERT LINES HERE"
    found = False
    for i, line in enumerate(lines):
        if placeholder in line:
            # Replace the placeholder with the research statement text
            lines[i] = rs_text + "\n"
            found = True
            break

    if not found:
        raise ValueError(f"Placeholder '{placeholder}' not found in {file_path}.")

    # Write the modified lines back to the file
    with open(file_path, "w") as f:
        f.writelines(lines)


def copy_and_rename_dir(src_dir, dst_parent, new_name):
    """
    Copy a directory to another parent directory and rename it.

    Args:
        src_dir (str or Path): Path to the source directory.
        dst_parent (str or Path): Path to the destination parent directory.
        new_name (str): New name for the copied directory.

    Returns:
        Path: Path to the new copied and renamed directory.
    """
    src_dir = Path(src_dir)
    dst_parent = Path(dst_parent)
    dst_dir = dst_parent / new_name
    shutil.copytree(src_dir, dst_dir)
    return dst_dir
