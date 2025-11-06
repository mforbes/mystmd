import path from 'node:path';
import type MystTemplate from 'myst-templates';
import { createCommand } from '../utils.js';

export function pdfTexExportCommand(
  texFile: string,
  logFile: string,
  template?: MystTemplate,
): string {
  const templateYml = template?.getValidatedTemplateYml();
  const engine = templateYml?.build?.engine ?? '-xelatex';
  const setenv = "export XDG_CONFIG_HOME=${INIT_CWD}/tests/pdf-latexmkrc";
  const pre = "${setenv} && env > ${INIT_CWD}/tests/pdf-latexmkrc/_env.log";
  const baseCommand = `${setenv} && latexmk -f ${engine} -synctex=1 -interaction=batchmode -file-line-error -latexoption="-shell-escape" ${texFile}`;

  return createCommand(baseCommand, logFile);
}

export function texMakeGlossariesCommand(texFile: string, logFile: string): string {
  const fileNameNoExt = path.basename(texFile, '.tex');
  const baseCommand = `makeglossaries ${fileNameNoExt}`;

  return createCommand(baseCommand, logFile);
}
