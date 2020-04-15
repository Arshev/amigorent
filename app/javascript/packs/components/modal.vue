<script>
  export default {
    name: 'modal',
    methods: {
      close() {
        this.$emit('close');
      },
    },
  };
</script>
<template>
  <transition name="modal">
        <div class="modal-mask">
          <div class="modal-wrapper">
            <div class="modal-container">
              <div class="modal-header">
                <slot name="header">
                  <h2>Заявка успешно отправлена!</h2>
                </slot>
              </div>

              <div class="modal-body">
                <slot name="body">
                  <p>Мы свяжемся с вами в ближайщее время, если этого не произойдет, позвоните нам!</p>
                  <p>Чтобы процесс оформления договора аренды был быстрее, пришлите нам фото паспорта и водительского удостоверения.</p>
                  <p>На почту: <a href="mailto:amigorent@ya.ru">amigorent@ya.ru</a></p>
                  <p>Или в мессенджеры: <a style="color: #01df3a; float: none; display: inline;" href="whatsapp://send?phone=+79217101615">WhatsApp</a>, <a style="color: #8258fa; float: none; display: inline;" title="Viber" href="viber://add?number=79217101615">Viber</a>, <a style="color: blue; float: none; display: inline;" title="Telegram" href="tg://resolve?domain=amigorent_ru">Telegram</a></p>
                </slot>
              </div>

              <div class="modal-footer">
                <slot name="footer">
                  <div>
                    Спасибо за обращение!
                    <a href="" onclick="return false;" class="modal-default-button" @click="$emit('close')">
                    Закрыть
                    </a>
                  </div>
                  
                </slot>
              </div>
            </div>
          </div>
        </div>
      </transition>
</template>
<style>
  .modal-mask {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: table;
    transition: opacity 0.3s ease;
  }

  .modal-wrapper {
    display: table-cell;
    vertical-align: middle;
  }

  .modal-container {
    width: 600px;
    margin: 0px auto;
    padding: 20px 30px;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
    transition: all 0.3s ease;
    font-family: Helvetica, Arial, sans-serif;
  }

  .modal-header h3 {
    margin-top: 0;
    color: #42b983;
  }

  .modal-body {
    margin: 20px 0;
  }

  .modal-default-button {
    width: 100px;
    float: right;
    text-align: center;
    color: #fff;
    text-decoration: none;
    font-family: 'Georgia', sans-serif;
    border: 1px solid #d67e2a;
    background: #d67e2a;
    line-height: 37px;
    border-radius: 25px;
    font-size: 18px;
  }

  /*
  * The following styles are auto-applied to elements with
  * transition="modal" when their visibility is toggled
  * by Vue.js.
  *
  * You can easily play with the modal transition by editing
  * these styles.
  */

  .modal-enter {
    opacity: 0;
  }

  .modal-leave-active {
    opacity: 0;
  }

  .modal-enter .modal-container,
  .modal-leave-active .modal-container {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
  }
</style>
