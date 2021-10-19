<template>
  <div id="bookings">
    <loading
      :active.sync="isLoading"
      :is-full-page="true"
      color="#1976d2"
    ></loading>
    <div class="bookings">
      <a class="arend" @click="openDialog()">Забронировать</a>
      
      <modal name="my-first-modal"  :scrollable="true" :adaptive="true" :width="1446" height="100%">
        <div class="content">
          <div class="wrapper">
            <div style="text-align: right">
                    <a
                      class="modal-close-button"
                      @click="closeDialog()"
                    >
                      Закрыть
                    </a>
                  </div>
            <div class="page_zakaz">
              <div class="zagol">Бронирование автомобиля</div>
              <div class="pol1">
                <div class="zag">Место подачи авто</div>
                <div class="obo">
                  <div class="in1">
                    <select>
                      <option>Место подачи</option>
                      <option>Аэропорт</option>
                      <option>Город</option>
                    </select>
                  </div>
                  <div class="in1">
                    <input
                      type="date"
                      value=""
                      placeholder="Дата начала аренды"
                      class="inp1"
                      name=""
                    />
                  </div>
                  <div class="in1">
                    <input
                      type="text"
                      value=""
                      placeholder="13:00"
                      class="inp2"
                      name=""
                    />
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Место возврата авто</div>
                <div class="obo">
                  <div class="in1">
                    <select>
                      <option>Место возврата</option>
                      <option>Аэропорт</option>
                      <option>Город</option>
                    </select>
                  </div>
                  <div class="in1">
                    <input
                      type="date"
                      value=""
                      placeholder="Дата возврата"
                      class="inp1"
                      name=""
                    />
                  </div>
                  <div class="in1">
                    <input
                      type="text"
                      value=""
                      placeholder="13:00"
                      class="inp2"
                      name=""
                    />
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Личные данные</div>
                <div class="obo">
                  <div class="in2">
                    <input
                      type="text"
                      value=""
                      placeholder="Ваше имя"
                      name=""
                    />
                  </div>
                  <div class="in2">
                    <input
                      type="text"
                      value=""
                      placeholder="Ваша фамилия"
                      name=""
                    />
                  </div>
                  <div class="in2">
                    <input
                      type="text"
                      value=""
                      placeholder="+7(123) 456-78-90"
                      name=""
                    />
                  </div>
                  <div class="in2">
                    <input
                      type="text"
                      value=""
                      placeholder="E-mail"
                      name=""
                    />
                  </div>
                  <div class="clear"></div>
                </div>
              </div>
              <div class="pol2">
                <div class="zag">Huyndai solaris</div>
                <div
                  class="bl_img"
                  :style="`background-image: url(${image_link})`"
                ></div>
                <div class="pod">В стоимость аренды включено:</div>
                <label>
                  <input type="checkbox" value="" checked name="" />
                  <i>Автомобиль</i>
                  <span>10 000 ₽</span>
                </label>
                <label>
                  <input type="checkbox" value="" checked name="" />
                  <i>Детское кресло</i>
                  <span>+1 000 ₽</span>
                </label>
                <label>
                  <input type="checkbox" value="" name="" />
                  <i>GPS навигатор</i>
                  <span>700 ₽</span>
                </label>
                <label>
                  <input type="checkbox" value="" name="" />
                  <i>Зарядное устройство</i>
                  <span>0 ₽</span>
                </label>
                <label>
                  <input type="checkbox" value="" name="" />
                  <i>Держатель для тел-на</i>
                  <span>0 ₽</span>
                </label>
                <label>
                  <input type="checkbox" value="" name="" />
                  <i>Провод AUX</i>
                  <span>0 ₽</span>
                </label>
                <div class="price">
                  Цена аренды: <span>11 000 ₽</span>
                </div>
              </div>
              <div class="clear"></div>
              <div class="obol2">
                <div class="ch1">
                  <label>
                    <input type="checkbox" value="" name="" />
                    Я соглашаюсь с уловиями аренды автомобиля
                  </label>
                  <label>
                    <input type="checkbox" value="" name="" />
                    Я соглашаюсь с уловиями политики
                    конфиденциальности
                  </label>
                </div>
                <button>Арендовать</button>
                <div class="clear"></div>
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </modal>
    </div>
  </div>
</template>

<script>
export default {
  props: [
    'image_link'
  ],
  data: function () {
    return {
      phone: null,
      name: null,
      text: null,
      showModal: false,
      isLoading: false,
    };
  },
  methods: {
    openDialog() {
      this.$modal.show('my-first-modal');
    },
    closeDialog() {
      this.$modal.hide('my-first-modal');
    },
    sendBooking() {
      if (this.name && this.phone) {
        this.isLoading = true;
        this.axios
          .post(
            `/api/v1/call_booking`,
            {
              name: this.name,
              phone: this.phone,
              text: this.text,
            },
            {
              headers: {
                Authorization:
                  "Bearer 2ed8e4a9369da6842e9d5c03fdb44b5d3e86e5b08c626529af8bd3",
              },
            }
          )
          .then(() => {
            this.showModal = false;
            this.name = null;
            this.phone = null;
            this.text = null;
            this.$swal({
              type: "success",
              title: "Заявка отправлена!",
              text: "Пожалуйста, ожидайте ответа менеджера",
            });
          })
          .catch((error) => {
            this.$swal({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              type: "error",
              title: "Ошибка при отправке!",
              text: error,
            });
          })
          .finally((this.isLoading = false));
      } else {
        this.$swal({
          type: "warning",
          title: "Ошибка при отправке!",
          text: "Пожалуйста заполните имя и телефон",
        });
      }
    },
  },
};
</script>

<style scoped>
 .bookings .content {
   padding: 20px 0px;
 }
 .modal-close-button {
  display: inline-block;
  padding: 5px;
  background-color: #ef7f1a;
}
</style>
