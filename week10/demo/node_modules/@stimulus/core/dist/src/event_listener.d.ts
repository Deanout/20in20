import { Binding } from "./binding";
export declare class EventListener implements EventListenerObject {
    readonly eventTarget: EventTarget;
    readonly eventName: string;
    private unorderedBindings;
    constructor(eventTarget: EventTarget, eventName: string);
    connect(): void;
    disconnect(): void;
    /** @hidden */
    bindingConnected(binding: Binding): void;
    /** @hidden */
    bindingDisconnected(binding: Binding): void;
    handleEvent(event: Event): void;
    readonly bindings: Binding[];
}
