import { Logger } from "../../../logger";
import { runDartBuildRunner } from "./tasks/build_runner";
import { generateLocales } from "./tasks/locale";
import { generateMeta } from "./tasks/meta";

const logger = new Logger("generator:run");

const tasks: (() => Promise<void>)[] = [
    runDartBuildRunner,
    generateLocales,
    generateMeta,
];

export const generate = async () => {
    logger.log(`Starting r{clr,cyanBright,${tasks.length}} tasks...`);

    await Promise.all(tasks.map((x) => x()));

    logger.log(`Finished running r{clr,cyanBright,${tasks.length}} tasks.`);
};
