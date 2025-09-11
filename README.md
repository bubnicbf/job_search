# Job Search

This repository contains my resume, CV, and abstract, all built with LaTeX.

## Documents

- [Resume (2 pages)](https://github.com/bubnicbf/job_search/raw/master/output/resume.pdf)
- [Abstract (1 page)](https://github.com/bubnicbf/job_search/raw/master/output/abstract.pdf)
- [Full CV (4 pages)](https://github.com/bubnicbf/job_search/raw/master/output/cv.pdf)

## Preview (Resume)

If your browser supports inline PDFs, you can preview the resume below:

<object data="https://github.com/bubnicbf/job_search/raw/master/output/resume.pdf" type="application/pdf" width="100%" height="800px">
  <embed src="https://github.com/bubnicbf/job_search/raw/master/output/resume.pdf" type="application/pdf">
    <p>This browser does not support embedded PDFs.  
       You can <a href="https://github.com/bubnicbf/job_search/raw/master/output/resume.pdf">download the resume here</a>.</p>
  </embed>
</object>

---

## Build Instructions

This project includes a `Makefile` to simplify building all documents with **XeLaTeX**.

### Requirements
- [XeLaTeX](https://tug.org/xetex/) (available through TeX Live or MiKTeX)
- `make` (built in on macOS/Linux, installable on Windows via WSL or Git Bash)

### Usage

From the repository root:

- **Build everything (CV, resume, abstract):**
  ```bash
  make
```

- **Build a specific document:**
  ```bash
make cv
make resume
make abstract
```

- **Open the résumé PDF (macOS only):**
  ```bash
make open
```

- **Clean build artifacts (logs, aux files, etc.), keep PDFs:**
  ```bash
make clean
```

- **Clean build artifacts and PDFs:**
  ```bash
make distclean
```

### Outputs

- PDFs are written to the `output/` directory.

- Auxiliary build artifacts (`.aux`, `.log`, `.out`, etc.) are written to `build_artifact/`.