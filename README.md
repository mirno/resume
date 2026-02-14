# Resume / CV (RenderCV)

This repository contains my CV written in YAML and rendered to PDF using **RenderCV**.

## [**Click here** for the CV in markdown format](cv.md)

- Source of truth: `cv/Mirno_Hoogendonk_CV.yaml`
- Generated output: `rendercv_output/` (default path; ignored by git)
- run `make build` to generate the content
- run `make lint` to lint the files and check for typos

Uses the `yaml-language-server` and the corresponding [JSON-schema](https://raw.githubusercontent.com/rendercv/rendercv/refs/tags/v2.4/schema.json) to auto-complete

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#built-with">Built With NIX</a>
  </ol>
</details>

### Built With NIX

* [![Nix][Nix.com]][Nix-url]
* [DirEnv](https://direnv.net/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Nix.com]: https://builtwithnix.org/badge.svg
[Nix-url]: https://builtwithnix.org