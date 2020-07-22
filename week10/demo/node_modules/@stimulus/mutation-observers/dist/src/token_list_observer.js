import { AttributeObserver } from "./attribute_observer";
import { Multimap } from "@stimulus/multimap";
var TokenListObserver = /** @class */ (function () {
    function TokenListObserver(element, attributeName, delegate) {
        this.attributeObserver = new AttributeObserver(element, attributeName, this);
        this.delegate = delegate;
        this.tokensByElement = new Multimap;
    }
    Object.defineProperty(TokenListObserver.prototype, "started", {
        get: function () {
            return this.attributeObserver.started;
        },
        enumerable: true,
        configurable: true
    });
    TokenListObserver.prototype.start = function () {
        this.attributeObserver.start();
    };
    TokenListObserver.prototype.stop = function () {
        this.attributeObserver.stop();
    };
    TokenListObserver.prototype.refresh = function () {
        this.attributeObserver.refresh();
    };
    Object.defineProperty(TokenListObserver.prototype, "element", {
        get: function () {
            return this.attributeObserver.element;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(TokenListObserver.prototype, "attributeName", {
        get: function () {
            return this.attributeObserver.attributeName;
        },
        enumerable: true,
        configurable: true
    });
    // Attribute observer delegate
    TokenListObserver.prototype.elementMatchedAttribute = function (element) {
        this.tokensMatched(this.readTokensForElement(element));
    };
    TokenListObserver.prototype.elementAttributeValueChanged = function (element) {
        var _a = this.refreshTokensForElement(element), unmatchedTokens = _a[0], matchedTokens = _a[1];
        this.tokensUnmatched(unmatchedTokens);
        this.tokensMatched(matchedTokens);
    };
    TokenListObserver.prototype.elementUnmatchedAttribute = function (element) {
        this.tokensUnmatched(this.tokensByElement.getValuesForKey(element));
    };
    TokenListObserver.prototype.tokensMatched = function (tokens) {
        var _this = this;
        tokens.forEach(function (token) { return _this.tokenMatched(token); });
    };
    TokenListObserver.prototype.tokensUnmatched = function (tokens) {
        var _this = this;
        tokens.forEach(function (token) { return _this.tokenUnmatched(token); });
    };
    TokenListObserver.prototype.tokenMatched = function (token) {
        this.delegate.tokenMatched(token);
        this.tokensByElement.add(token.element, token);
    };
    TokenListObserver.prototype.tokenUnmatched = function (token) {
        this.delegate.tokenUnmatched(token);
        this.tokensByElement.delete(token.element, token);
    };
    TokenListObserver.prototype.refreshTokensForElement = function (element) {
        var previousTokens = this.tokensByElement.getValuesForKey(element);
        var currentTokens = this.readTokensForElement(element);
        var firstDifferingIndex = zip(previousTokens, currentTokens)
            .findIndex(function (_a) {
            var previousToken = _a[0], currentToken = _a[1];
            return !tokensAreEqual(previousToken, currentToken);
        });
        if (firstDifferingIndex == -1) {
            return [[], []];
        }
        else {
            return [previousTokens.slice(firstDifferingIndex), currentTokens.slice(firstDifferingIndex)];
        }
    };
    TokenListObserver.prototype.readTokensForElement = function (element) {
        var attributeName = this.attributeName;
        var tokenString = element.getAttribute(attributeName) || "";
        return parseTokenString(tokenString, element, attributeName);
    };
    return TokenListObserver;
}());
export { TokenListObserver };
function parseTokenString(tokenString, element, attributeName) {
    return tokenString.trim().split(/\s+/).filter(function (content) { return content.length; })
        .map(function (content, index) { return ({ element: element, attributeName: attributeName, content: content, index: index }); });
}
function zip(left, right) {
    var length = Math.max(left.length, right.length);
    return Array.from({ length: length }, function (_, index) { return [left[index], right[index]]; });
}
function tokensAreEqual(left, right) {
    return left && right && left.index == right.index && left.content == right.content;
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoidG9rZW5fbGlzdF9vYnNlcnZlci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90b2tlbl9saXN0X29ic2VydmVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBLE9BQU8sRUFBRSxpQkFBaUIsRUFBNkIsTUFBTSxzQkFBc0IsQ0FBQTtBQUNuRixPQUFPLEVBQUUsUUFBUSxFQUFFLE1BQU0sb0JBQW9CLENBQUE7QUFjN0M7SUFLRSwyQkFBWSxPQUFnQixFQUFFLGFBQXFCLEVBQUUsUUFBbUM7UUFDdEYsSUFBSSxDQUFDLGlCQUFpQixHQUFHLElBQUksaUJBQWlCLENBQUMsT0FBTyxFQUFFLGFBQWEsRUFBRSxJQUFJLENBQUMsQ0FBQTtRQUM1RSxJQUFJLENBQUMsUUFBUSxHQUFHLFFBQVEsQ0FBQTtRQUN4QixJQUFJLENBQUMsZUFBZSxHQUFHLElBQUksUUFBUSxDQUFBO0lBQ3JDLENBQUM7SUFFRCxzQkFBSSxzQ0FBTzthQUFYO1lBQ0UsT0FBTyxJQUFJLENBQUMsaUJBQWlCLENBQUMsT0FBTyxDQUFBO1FBQ3ZDLENBQUM7OztPQUFBO0lBRUQsaUNBQUssR0FBTDtRQUNFLElBQUksQ0FBQyxpQkFBaUIsQ0FBQyxLQUFLLEVBQUUsQ0FBQTtJQUNoQyxDQUFDO0lBRUQsZ0NBQUksR0FBSjtRQUNFLElBQUksQ0FBQyxpQkFBaUIsQ0FBQyxJQUFJLEVBQUUsQ0FBQTtJQUMvQixDQUFDO0lBRUQsbUNBQU8sR0FBUDtRQUNFLElBQUksQ0FBQyxpQkFBaUIsQ0FBQyxPQUFPLEVBQUUsQ0FBQTtJQUNsQyxDQUFDO0lBRUQsc0JBQUksc0NBQU87YUFBWDtZQUNFLE9BQU8sSUFBSSxDQUFDLGlCQUFpQixDQUFDLE9BQU8sQ0FBQTtRQUN2QyxDQUFDOzs7T0FBQTtJQUVELHNCQUFJLDRDQUFhO2FBQWpCO1lBQ0UsT0FBTyxJQUFJLENBQUMsaUJBQWlCLENBQUMsYUFBYSxDQUFBO1FBQzdDLENBQUM7OztPQUFBO0lBRUQsOEJBQThCO0lB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