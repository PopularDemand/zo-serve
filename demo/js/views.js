var App = App ? App : {};

App.Views = (function($, SVGs) {
  const els = {};
  const h = {};

  els.createButton = (className, clickHandler) => {
    const btnKey = _createElementKeyFromSelector(className);
    this[btnKey] = $('<button></button>').addClass(className).text(className.replace('-', ' '));
    this[btnKey].click(clickHandler);
    $('.content').append(this[btnKey]);
  };

  const init = () => {
    els.$createGameButton = $('<button></button>').addClass('create-game-button').text('create game');
    $('.content').append(els.$createGameButton);

    els.$subscribeButton = $('<button></button>').addClass('subscription-button').text('create subscription');
    $('.content').append(els.$subscribeButton);
  };

  const initHandlers = (handlers) => {
    for (handler in handlers) {
      h[handler] = warnIfUndefined(handlers[handler]);
    }
    els.$subscribeButton.click(h.handleSubscribe);
    els.$createGameButton.click(h.handleCreateGame);
  };

  const displayIcons = (icons, actualIcon) => {
    _wipeBoards();
    _displayActualIcon(actualIcon);
    _displayIconSet(icons);
  };

  const displayResults = (selections) => {
    let result, $tr, $actual, $selected, $result;
    const $resultsBody = $('.results-body');
    selections.forEach((selection) => {
      let { actual, selected } = selection
      result = actual.id === selected.id ? 'Correct' : 'Wrong';
      $tr = $('<tr></tr>').addClass('selection-row');
      $actual = $('<td></td>').html(_getSVG(actual)).addClass('actual-cell');
      $selected = $('<td></td>').html(_getSVG(selected)).addClass('selected-cell');
      $result = $('<td></td>').html(result).addClass('result-cell');

      $tr.append($actual);
      $tr.append($selected);
      $tr.append($result);
      $resultsBody.append($tr);
    });
  };

  /**********
   * Helpers
   *********/

  const _wipeBoards = () => {
    $('.sender-board').html('');
    $('.receiver-board').html('');
  };

  const _displayActualIcon = (icon) => {
    const $svg = _getSVG(icon);
    $('.sender-board').append($svg);
  };

  const _displayIconSet = (iconSet) => {
    let $svg, $button;

    iconSet.forEach((icon) => {
      $svg = _getSVG(icon);
      $button = $('<button></button>').addClass('selection-button');
      $button.click((evt) => {
        h.handleMakeSelection(icon.id);
      });
      $button.append($svg);
      $('.receiver-board').append($button);
    });
  };

  const _createElementKeyFromSelector = (selector) => {
    return selector.split('-').reduce((finalKey, word, index) => {
      return finalKey += index === 0 ? word : word[0].toUpperCase() + word.slice(1);
    }, '$');
  };

    const warnIfUndefined = (func) => {
    if (!func) {
      return function(evt) {
        console.warn(`${evt.type} handler for ${evt.currentTarget} is undefined.`);
      }
    }
    return func;
  };

  const _getSVG = (icon) => {
    const markup = SVGs[icon.shape];
    return $(markup)
      .addClass('selection-icon')
      .css({ fill: `${icon.color}` });
  };

  return {
    els,
    init,
    initHandlers,
    displayIcons,
    displayResults
  };

})(jQuery, App.SVGs);
