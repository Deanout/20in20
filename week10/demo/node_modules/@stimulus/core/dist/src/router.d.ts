import { Application } from "./application";
import { Context } from "./context";
import { Definition } from "./definition";
import { Module } from "./module";
import { Schema } from "./schema";
import { Scope } from "./scope";
import { ScopeObserverDelegate } from "./scope_observer";
export declare class Router implements ScopeObserverDelegate {
    readonly application: Application;
    private scopeObserver;
    private scopesByIdentifier;
    private modulesByIdentifier;
    constructor(application: Application);
    readonly element: Element;
    readonly schema: Schema;
    readonly controllerAttribute: string;
    readonly modules: Module[];
    readonly contexts: Context[];
    start(): void;
    stop(): void;
    loadDefinition(definition: Definition): void;
    unloadIdentifier(identifier: string): void;
    getContextForElementAndIdentifier(element: Element, identifier: string): Context | undefined;
    /** @hidden */
    handleError(error: Error, message: string, detail: any): void;
    /** @hidden */
    scopeConnected(scope: Scope): void;
    /** @hidden */
    scopeDisconnected(scope: Scope): void;
    private connectModule;
    private disconnectModule;
}
