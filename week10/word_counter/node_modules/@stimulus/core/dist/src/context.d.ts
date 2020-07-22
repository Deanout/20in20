import { Application } from "./application";
import { Controller } from "./controller";
import { Dispatcher } from "./dispatcher";
import { ErrorHandler } from "./error_handler";
import { Module } from "./module";
import { Schema } from "./schema";
import { Scope } from "./scope";
export declare class Context implements ErrorHandler {
    readonly module: Module;
    readonly scope: Scope;
    readonly controller: Controller;
    private bindingObserver;
    constructor(module: Module, scope: Scope);
    connect(): void;
    disconnect(): void;
    readonly application: Application;
    readonly identifier: string;
    readonly schema: Schema;
    readonly dispatcher: Dispatcher;
    readonly element: Element;
    readonly parentElement: Element | null;
    handleError(error: Error, message: string, detail?: object): void;
}
