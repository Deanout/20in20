import { ActionDescriptor } from "./action_descriptor";
import { Token } from "@stimulus/mutation-observers";
export declare class Action {
    readonly element: Element;
    readonly index: number;
    readonly eventTarget: EventTarget;
    readonly eventName: string;
    readonly identifier: string;
    readonly methodName: string;
    static forToken(token: Token): Action;
    constructor(element: Element, index: number, descriptor: Partial<ActionDescriptor>);
    toString(): string;
    private readonly eventTargetName;
}
export declare function getDefaultEventNameForElement(element: Element): string | undefined;
