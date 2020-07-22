var __extends = (this && this.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
/** @hidden */
export function blessDefinition(definition) {
    return {
        identifier: definition.identifier,
        controllerConstructor: blessControllerConstructor(definition.controllerConstructor)
    };
}
function blessControllerConstructor(controllerConstructor) {
    var constructor = extend(controllerConstructor);
    constructor.bless();
    return constructor;
}
var extend = (function () {
    function extendWithReflect(constructor) {
        function Controller() {
            var _newTarget = this && this instanceof Controller ? this.constructor : void 0;
            return Reflect.construct(constructor, arguments, _newTarget);
        }
        Controller.prototype = Object.create(constructor.prototype, {
            constructor: { value: Controller }
        });
        Reflect.setPrototypeOf(Controller, constructor);
        return Controller;
    }
    function testReflectExtension() {
        var a = function () { this.a.call(this); };
        var b = extendWithReflect(a);
        b.prototype.a = function () { };
        return new b;
    }
    try {
        testReflectExtension();
        return extendWithReflect;
    }
    catch (error) {
        return function (constructor) { return /** @class */ (function (_super) {
            __extends(Controller, _super);
            function Controller() {
                return _super !== null && _super.apply(this, arguments) || this;
            }
            return Controller;
        }(constructor)); };
    }
})();
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZGVmaW5pdGlvbi5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy9kZWZpbml0aW9uLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7Ozs7Ozs7Ozs7QUFPQSxjQUFjO0FBQ2QsTUFBTSwwQkFBMEIsVUFBc0I7SUFDcEQsT0FBTztRQUNMLFVBQVUsRUFBRSxVQUFVLENBQUMsVUFBVTtRQUNqQyxxQkFBcUIsRUFBRSwwQkFBMEIsQ0FBQyxVQUFVLENBQUMscUJBQXFCLENBQUM7S0FDcEYsQ0FBQTtBQUNILENBQUM7QUFFRCxvQ0FBb0MscUJBQTRDO0lBQzlFLElBQU0sV0FBVyxHQUFHLE1BQU0sQ0FBQyxxQkFBcUIsQ0FBQyxDQUFBO0lBQ2pELFdBQVcsQ0FBQyxLQUFLLEVBQUUsQ0FBQTtJQUNuQixPQUFPLFdBQVcsQ0FBQTtBQUNwQixDQUFDO0FBRUQsSUFBTSxNQUFNLEdBQUcsQ0FBQztJQUdkLDJCQUFzRCxXQUFjO1FBQ2xFOztZQUNFLE9BQU8sT0FBTyxDQUFDLFNBQVMsQ0FBQyxXQUFXLEVBQUUsU0FBUyxhQUFhLENBQUE7UUFDOUQsQ0FBQztRQUVELFVBQVUsQ0FBQyxTQUFTLEdBQUcsTUFBTSxDQUFDLE1BQU0sQ0FBQyxXQUFXLENBQUMsU0FBUyxFQUFFO1lBQzFELFdBQVcsRUFBRSxFQUFFLEtBQUssRUFBRSxVQUFVLEVBQUU7U0FDbkMsQ0FBQyxDQUFBO1FBRUYsT0FBTyxDQUFDLGNBQWMsQ0FBQyxVQUFVLEVBQUUsV0FBVyxDQUFDLENBQUE7UUFDL0MsT0FBTyxVQUFpQixDQUFBO0lBQzFCLENBQUM7SUFFRDtRQUNFLElBQU0sQ0FBQyxHQUFHLGNBQXNCLElBQUksQ0FBQyxDQUFDLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxDQUFBLENBQUMsQ0FBUSxDQUFBO1FBQzFELElBQU0sQ0FBQyxHQUFHLGlCQUFpQixDQUFDLENBQUMsQ0FBQyxDQUFBO1FBQzlCLENBQUMsQ0FBQyxTQUFTLENBQUMsQ0FBQyxHQUFHLGNBQVksQ0FBQyxDQUFBO1FBQzdCLE9BQU8sSUFBSSxDQUFDLENBQUE7SUFDZCxDQUFDO0lBRUQsSUFBSTtRQUNGLG9CQUFvQixFQUFFLENBQUE7UUFDdEIsT0FBTyxpQkFBaUIsQ0FBQTtLQUN6QjtJQUFDLE9BQU8sS0FBSyxFQUFFO1FBQ2QsT0FBTyxVQUE0QixXQUFjLElBQUs7WUFBeUIsOEJBQVc7WUFBcEM7O1lBQXNDLENBQUM7WUFBRCxpQkFBQztRQUFELENBQUMsQUFBdkMsQ0FBeUIsV0FBVyxJQUFwQyxDQUF1QyxDQUFBO0tBQzlGO0FBQ0gsQ0FBQyxDQUFDLEVBQUUsQ0FBQSJ9