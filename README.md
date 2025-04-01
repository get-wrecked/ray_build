There's no easy way to run a forked version of Ray without creating a wheel (https://github.com/ray-project/ray/issues/51755#issuecomment-2760495837). This repository builds a wheel of Ray based on our fork https://github.com/get-wrecked/ray

To update:
1. Make any modifications required on the https://github.com/get-wrecked/ray main branch
2. Update the `ray` folder (submodule) in this repo to point to the right version in the ray fork
3. Commit, and create a tag. The tag will be built on the github CI.
4. Update `pyproject.toml` with something like this:

```toml
[tool.uv.sources]
ray = { url = "https://github.com/get-wrecked/ray_build/releases/download/v2.44.1-4/ray_medal-1.0.0-cp312-cp312-macosx_11_0_arm64.whl" }
```
