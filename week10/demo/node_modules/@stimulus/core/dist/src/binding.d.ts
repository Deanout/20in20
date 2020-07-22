import { Action } from "./action";
import { Context } from "./context";
export declare class Binding {
    readonly context: Context;
    readonly action: Action;
    constructor(context: Context, action: Action);
    readonly index: number;
    readonly eventTarget: EventTarget;
    readonly identifier: string;
    handleEvent(event: Event): void;
    readonly eventName: string;
    readonly method: Function;
    private invokeWithEvent;
    private willBeInvokedByEvent;
    private readonly controller;
    private readonly methodName;
    private readonly element;
    private readonly scope;
}
