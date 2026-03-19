import { spawnSync } from "node:child_process";
import { existsSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, "..");

const inputDir = process.argv[2];
const configName = process.argv[3] ?? "config.json";

if (!inputDir) {
  console.error("usage: bun run generate <input-directory> [config.json]");
  process.exit(1);
}

const configPath = resolve(root, configName);
if (!existsSync(configPath)) {
  console.error(`config not found: ${configPath}`);
  process.exit(1);
}

const svgGlob = join(resolve(inputDir), "**", "*.svg");
const binName = process.platform === "win32" ? "svg-sprite.cmd" : "svg-sprite";
const bin = join(root, "node_modules", ".bin", binName);

const result = spawnSync(bin, ["-s", `--config=${configPath}`, svgGlob], {
  cwd: root,
  stdio: "inherit",
  shell: false,
});

process.exit(result.status ?? 1);
