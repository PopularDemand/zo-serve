var App = App || {};

$(document).ready(function() {
  App.cable = ActionCable.createConsumer('ws://localhost:3000/cable');

  const cableHandlers = {
    connected: () => {
      console.log('connected! ', new Date().toISOString());
    },
    disconnected: (data) => {
      console.log('disconnected with data: ', data);
    },
    rejected: (data) => {
      console.log('subscription rejected with data: ', data);
    },
    received: (data) => {
      console.log('received: ', data);
    }
  }

  if (App.Views) {
    App.Views.init();

    App.Views.initHandlers({
      handleSubscribe: (evt) => {
        const id = App.Views.els.$subscribeButton.data('gameId');

        if (!id) {
          console.log('Could not find the game id. Data: ' + App.Views.els.$subscribeButton.data());
          return;
        }

        App.chatChannel = App.cable.subscriptions.create({
          channel: 'GameChannel',
          room: `game_receiver_${id}`,
          game_id: id,
          is_receiver: true
        }, cableHandlers);

        App.Views.els.createButton('initialize-round', (evt) => {
          App.chatChannel.perform('initialize_round');
        });
      },
      handleCreateGame: () => {
        // add data
        const gameData = {
          receiver_id: 16
        };

        $.post('http://localhost:3000/games?' + $.param({ game: gameData }))
        .then((res) => {
          App.Views.els.$subscribeButton.data('gameId', res.game.id);
        });
      }
    });
  }
});
