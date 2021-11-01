<template>
  <div id="app">
    <loading
      :active.sync="isLoading"
      :is-full-page="true"
      color="#1976d2"
    ></loading>
    <div v-if="locale && locale == 'en'">
      <a class="zaya" @click="showModal = true">Leave a request</a>
      <div v-if="showModal">
        <div class="modal-mask">
          <div class="modal-wrapper">
            <div class="modal-container">
              <div class="modal-body">
                <slot name="body">
                  <div style="text-align: left">
                    <button
                      class="modal-default-button"
                      @click="showModal = false"
                    >
                      Close
                    </button>
                  </div>
                  <div class="bl_contact2_modal">
                    <div>
                      <div class="zag">Have questions?</div>
                      <form @submit.prevent="sendBooking()">
                        <input
                          v-model="name"
                          type="text"
                          value=""
                          placeholder="Your name"
                          name=""
                        />
                        <input
                          v-model="phone"
                          type="phone"
                          value=""
                          placeholder="+ 7 (123) 456-78-90"
                          name=""
                        />
                        <input
                          v-model="text"
                          type="textarea"
                          name="text"
                          placeholder="Текст"
                        />
                        <input type="submit" value="Send" />
                        <div class="clear"></div>
                      </form>
                      <div class="clear"></div>
                    </div>
                  </div>
                </slot>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-else>
      <a class="zaya" @click="showModal = true">Оставить заявку</a>
      <div v-if="showModal">
        <div class="modal-mask">
          <div class="modal-wrapper">
            <div class="modal-container">
              <div class="modal-body">
                <slot name="body">
                  <div style="text-align: left">
                    <button
                      class="modal-default-button"
                      @click="showModal = false"
                    >
                      Закрыть
                    </button>
                  </div>
                  <div class="bl_contact2_modal">
                    <div>
                      <div class="zag">Есть вопросы?</div>
                      <form @submit.prevent="sendBooking()">
                        <input
                          v-model="name"
                          type="text"
                          value=""
                          placeholder="Ваше имя"
                          name=""
                        />
                        <input
                          v-model="phone"
                          type="phone"
                          value=""
                          placeholder="+ 7 (123) 456-78-90"
                          name=""
                        />
                        <input
                          v-model="text"
                          type="textarea"
                          name="text"
                          placeholder="Текст"
                        />
                        <input type="submit" value="Оставить заявку" />
                        <div class="clear"></div>
                      </form>
                      <div class="clear"></div>
                    </div>
                  </div>
                </slot>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    locale: {
      type: String,
    },
  },
  data: function () {
    return {
      phone: null,
      name: null,
      text: null,
      showModal: false,
      isLoading: false
    };
  },
  methods: {
    sendBooking() {
      if (this.name && this.phone) {
        this.isLoading = true
        this.axios
          .post(
            `/api/v1/call_booking`,
            {
              name: this.name,
              phone: this.phone,
              text: this.text
            },
            {
              headers: {
                Authorization: "Bearer 2ed8e4a9369da6842e9d5c03fdb44b5d3e86e5b08c626529af8bd3"
              }
            }
          )
          .then(() => {
            this.showModal = false
            this.name = null
            this.phone = null
            this.text = null
            this.$swal({
              type: "success",
              title: "Заявка отправлена!",
              text: "Пожалуйста, ожидайте ответа менеджера"
            });
          })
          .catch(error => {
            this.$swal({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              type: "error",
              title: "Ошибка при отправке!",
              text: error
            });
          })
          .finally(
            this.isLoading = false
          );
      } else {
        this.$swal({
          type: "warning",
          title: "Ошибка при отправке!",
          text: "Пожалуйста заполните имя и телефон"
        });
      }
    }
  }
};
</script>

<style scoped>

</style>
