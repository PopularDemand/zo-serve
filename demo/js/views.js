var App = App ? App : {};

App.Views = (function($) {
  const els = {};
  els.createButton = (className, clickHandler) => {
    const btnKey = createElementKeyFromSelector(className);
    this[btnKey] = $('<button></button>').addClass(className).text(className.replace('-', ' '));
    this[btnKey].click(clickHandler);
    $('.content').append(this[btnKey]);
  }

  const warnIfUndefined = (func) => {
    if (!func) {
      return function(evt) {
        console.warn(`${evt.type} handler for ${evt.currentTarget} is undefined.`);
      }
    }
    return func;
  }

  const createElementKeyFromSelector = (selector) => {
    return selector.split('-').reduce((finalKey, word, index) => {
      return finalKey += index === 0 ? word : word[0].toUpperCase() + word.slice(1);
    }, '$');
  }

  return {
    init: function() {
      els.$subscribeButton = $('<button></button>').addClass('subscription-button').text('create subscription');
      $('.content').append(els.$subscribeButton);

      els.$createGameButton = $('<button></button>').addClass('create-game-button').text('create game');
      $('.content').append(els.$createGameButton);
    },

    initHandlers: function(handlers) {
      const h = {};
      for (handler in handlers) {
        h[handler] = warnIfUndefined(handlers[handler]);
      }
      els.$subscribeButton.click(h.handleSubscribe);
      els.$createGameButton.click(h.handleCreateGame);
    },
    els
  };
})(jQuery);
