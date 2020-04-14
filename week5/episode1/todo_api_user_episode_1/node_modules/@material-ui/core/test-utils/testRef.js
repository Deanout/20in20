"use strict";

var _interopRequireWildcard = require("@babel/runtime/helpers/interopRequireWildcard");

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = testRef;

var React = _interopRequireWildcard(require("react"));

var _chai = require("chai");

function assertDOMNode(node) {
  // duck typing a DOM node
  _chai.assert.ok(node.nodeName);
}
/**
 * Utility method to make assertions about the ref on an element
 * @param {React.ReactElement} element - The element should have a component wrapped
 *                                       in withStyles as the root
 * @param {function} mount - Should be returnvalue of createMount
 * @param {function} onRef - Callback, first arg is the ref.
 *                           Assert that the ref is a DOM node by default
 */


function testRef(element, mount) {
  var onRef = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : assertDOMNode;
  var ref = React.createRef();
  var wrapper = mount( /*#__PURE__*/React.createElement(React.Fragment, null, React.cloneElement(element, {
    ref: ref
  })));
  onRef(ref.current, wrapper);
}