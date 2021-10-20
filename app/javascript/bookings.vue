<template>
  <div id="bookings">
    <loading
      :active.sync="isLoading"
      :is-full-page="true"
      color="#1976d2"
    ></loading>
    <div class="bookings">
      <a class="arend" @click="openDialog()">Забронировать</a>

      <modal
        name="my-first-modal"
        :scrollable="true"
        :adaptive="true"
        :width="1446"
        height="100%"
      >
        <div class="content">
          <div class="wrapper">
            <div style="text-align: right">
              <a class="modal-close-button" @click="closeDialog()"> Закрыть </a>
            </div>
            <div class="page_zakaz">
              <div class="zagol">Бронирование автомобиля</div>
              <div>
                {{additional_hours}} {{prices[5]}} {{additional_hours * prices[5]}} {{days}}
              </div>
              <div class="pol1">
                <div class="zag">Начало аренды</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="start_date_no_time"
                      placeholder="Дата начала"
                      :config="configStart"
                      class="inp1"
                    ></flat-pickr>
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="start_time"
                      :config="configTime"
                      class="inp2"
                    ></flat-pickr>
                  </div>
                  <div class="in1">
                    <select v-if="locale == 'en'" v-model="location_start">
                      <option value="Офис">Office (free)</option>
                      <option
                        v-for="location in locations_en"
                        :key="location.index"
                      >
                        {{ location }}
                      </option>
                    </select>
                    <select v-else v-model="location_start">
                      <option value="Офис">Офис (бесплатно)</option>
                      <option
                        v-for="location in locations"
                        :key="location.index"
                      >
                        {{ location }}
                      </option>
                    </select>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Окончание аренда</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="end_date_no_time"
                      placeholder="Дата возврата"
                      :config="configEnd"
                      class="inp1"
                    ></flat-pickr>
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="end_time"
                      :config="configTime"
                      class="inp2"
                    ></flat-pickr>
                  </div>
                  <div class="in1">
                    <select v-if="locale == 'en'" v-model="location_end">
                      <option value="Офис">Office (free)</option>
                      <option
                        v-for="location in locations_en"
                        :key="location.index"
                      >
                        {{ location }}
                      </option>
                    </select>
                    <select v-else v-model="location_end">
                      <option value="Офис">Офис (бесплатно)</option>
                      <option
                        v-for="location in locations"
                        :key="location.index"
                      >
                        {{ location }}
                      </option>
                    </select>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Личные данные</div>
                <div class="obo">
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.lastname.$model"
                      type="text"
                      value=""
                      :placeholder="
                        locale == 'en' ? 'Input lastname' : 'Ваша фамилия'
                      "
                      name=""
                      :class="{ 'error-input': lastname_error }"
                    />
                    <span style="color: tomato" v-if="!$v.lastname.minLength">
                      - должна содержать минимум
                      {{ $v.lastname.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.lastname.maxLength">
                      - должна содержать максимум
                      {{ $v.lastname.$params.maxLength.max }} буквы</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.name.$model"
                      type="text"
                      value=""
                      placeholder="Ваше имя"
                      name=""
                    />
                    <span style="color: tomato" v-if="!$v.name.minLength">
                      - должно содержать минимум
                      {{ $v.name.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.name.maxLength">
                      - должно содержать максимум
                      {{ $v.name.$params.maxLength.max }} букв</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.middlename.$model"
                      type="text"
                      placeholder="Отчество"
                      name=""
                    />
                    <span style="color: tomato" v-if="!$v.middlename.minLength">
                      - должно содержать минимум
                      {{ $v.middlename.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.middlename.maxLength">
                      - должно содержать максимум
                      {{ $v.middlename.$params.maxLength.max }} букв</span
                    >
                  </div>
                  <div class="in2">
                    <the-mask
                      v-if="locale == 'ru'"
                      type="tel"
                      v-model="phone"
                      placeholder="79111111111"
                      v-bind:class="{ 'error-input': phone_error }"
                      :mask="['###########']"
                    />
                    <the-mask
                      v-else
                      type="tel"
                      v-model="phone"
                      placeholder="79111111111"
                      v-bind:class="{ 'error-input': phone_error }"
                      :mask="['###########', '############']"
                    />
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.email.$model"
                      placeholder="E-mail"
                      name=""
                    />
                    <span style="color: tomato" v-if="!$v.email.email">
                      - неправильный Email</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      type="text"
                      value=""
                      placeholder="Дата рождения"
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
                <div class="pod">Оборудование:</div>
                <label>
                  <input v-model="baby_chair" type="checkbox" name="" />
                  <i>Детское кресло</i>
                  <span>+ 500 ₽</span>
                </label>
                <label>
                  <input v-model="navigator" type="checkbox" name="" />
                  <i>GPS навигатор</i>
                  <span>+ 500 ₽</span>
                </label>
                <div class="price">
                  Цена аренды: <span>{{ price * days }} ₽</span>
                </div>
                <div class="price">
                  Доп время: <span>{{ additional_hours * prices[5] }} ₽</span>
                </div>
                <div class="price">
                  Доп оборудование:
                  <span>{{ baby_chair_price + navigator_price }} ₽</span>
                </div>
                <div class="price">
                  Доставка/возврат:
                  <span>{{ location_start_price + location_end_price }} ₽</span>
                </div>
                <div class="price">
                  Залог: <span>{{ prices[6] }} ₽</span>
                </div>
                <hr style="margin-bottom: 15px" />
                <div class="price">
                  Итого: <span>{{ total }} ₽</span>
                </div>
              </div>
              <div class="clear"></div>
              <div class="obol2">
                <div class="ch1">
                  <label>
                    <input type="checkbox" value="" name="" />
                    Подтверждаю, что ознакомился с
                    <a href="/terms" target="_blank">условиями аренды</a> и даю
                    согласие на обработку персональных данных, согласно
                    <a
                      href="https://base.garant.ru/12148567/"
                      target="_blank"
                      rel="nofollow"
                      >152-ФЗ</a
                    >
                  </label>
                  <!-- <label>
                    <input type="checkbox" value="" name="" />
                    Я соглашаюсь с уловиями политики
                    конфиденциальности
                  </label> -->
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
import flatPickr from "vue-flatpickr-component";
// import "flatpickr/dist/flatpickr.css";
import { Russian } from "flatpickr/dist/l10n/ru";
import moment from "moment";
import "moment/locale/ru";
import "moment-business-time";
moment.updateLocale("ru", {
  workinghours: {
    0: ["09:00:00", "19:00:00"],
    1: ["09:00:00", "19:00:00"],
    2: ["09:00:00", "19:00:00"],
    3: ["09:00:00", "19:00:00"],
    4: ["09:00:00", "19:00:00"],
    5: ["09:00:00", "19:00:00"],
    6: ["09:00:00", "19:00:00"],
  },
});
flatpickr.localize(Russian);
import {
  required,
  minLength,
  maxLength,
  email,
} from "vuelidate/lib/validators";
import { TheMask } from "vue-the-mask";
export default {
  props: {
    prices: {
      type: Array,
    },
    image_link: {
      type: String,
    },
    locale: {
      type: String,
    },
  },
  data: function () {
    return {
      price: 0,
      days: 0,
      total: 0,
      additional_hours: 0,
      hours: 0,
      baby_chair: false,
      navigator: false,
      start_date_no_time: null,
      end_date_no_time: null,
      phone: null,
      name: null,
      middlename: null,
      lastname: null,
      location_start: "Офис",
      location_end: "Офис",
      showModal: false,
      configStart: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: "today",
      },
      configTime: {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true,
        defaultDate: "11:00",
      },
      start_time: "11:00",
      end_time: "11:00",
      configEnd: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: "today",
      },
      errors: [],
      locations: [
        "Аэропорт",
        "Светлогорск",
        "Зеленоградск",
        "Калининград",
        "Офис",
      ],
      locations_en: [
        "Airport",
        "Svetlogorsk",
        "Zelenogradsk",
        "Another address in Kaliningrad",
        "Office",
      ],
      baby_chair_price: 0,
      navigator_price: 0,
      location_start_price: 0,
      location_end_price: 0,
      name_error: false,
      middlename_error: false,
      lastname_error: false,
      email_error: false,
      phone_error: false,
      terms_error: false,
      isLoading: false,
    };
  },
  watch: {
    end_date() {
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      let end_date = moment(this.end_date, "DD-MM-YYYY H:mm");
      let hours = moment.duration(end_date.diff(start_date)).asHours();

      let start_date_days = moment(this.start_date, "DD-MM-YYYY");
      let end_date_days = moment(this.end_date, "DD-MM-YYYY");
      this.additional_hours = 0;
      if (
        hours >
        moment.duration(end_date_days.diff(start_date_days)).asDays() * 24
      ) {
        this.hours = hours;
        let additionalHours = hours % 24;
        this.additional_hours = Math.trunc(additionalHours);
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();
      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff;
        }
        if (diff < 2) {
          this.days = "Минимум 2-е суток";
        }
        if (diff >= 2 && diff <= 3) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[0];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[0];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 3 && diff <= 7) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[1];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[1];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 7 && diff <= 14) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[2];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[2];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 14 && diff <= 30) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[3];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[3];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 30) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[4];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[4];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
      }
      // this.location_start = "Офис";
      // this.location_end = "Офис";
      // if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
      //   this.location_start_price = 0;
      // } else {
      //   this.location_start_price = 400;
      // }
      // if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
      //   this.location_end_price = 0;
      // } else {
      //   this.location_end_price = 400;
      // }
      this.errors = [];
    },
    start_date() {
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      let end_date = moment(this.end_date, "DD-MM-YYYY H:mm");

      let hours = moment.duration(end_date.diff(start_date)).asHours();

      let start_date_days = moment(this.start_date, "DD-MM-YYYY");
      let end_date_days = moment(this.end_date, "DD-MM-YYYY");
      this.additional_hours = 0;
      if (
        hours >
        moment.duration(end_date_days.diff(start_date_days)).asDays() * 24
      ) {
        this.hours = hours;
        let additionalHours = hours % 24;
        this.additional_hours = Math.trunc(additionalHours);
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();

      //let diff =  Math.floor(( Date.parse(this.end_date) - Date.parse(this.start_date) ) / 86400000)
      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff;
        }
        if (diff < 2) {
          this.days = "Минимум 2-е суток";
        }
        if (diff >= 2 && diff <= 3) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[0];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[0];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 3 && diff <= 7) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[1];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[1];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 7 && diff <= 14) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[2];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[2];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 14 && diff <= 30) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[3];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[3];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
        if (diff > 30) {
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.days = diff + 1;
            this.price = this.prices[4];
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            this.price = this.prices[4];
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
        }
      }
      // this.location_start = "Офис";
      // this.location_end = "Офис";
      // if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
      //   this.location_start_price = 0;
      // } else {
      //   this.location_start_price = 400;
      // }
      // if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
      //   this.location_end_price = 0;
      // } else {
      //   this.location_end_price = 400;
      // }
      this.errors = [];
    },
    location_start() {
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      switch (this.location_start) {
        case "Офис" || "Office":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 0;
          } else {
            this.location_start_price = 400;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Аэропорт" || "Airport":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 400;
          } else {
            this.location_start_price = 700;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Зеленоградск" || "Zelenogradsk":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 800;
          } else {
            this.location_start_price = 1300;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Светлогорск" || "Svetlogorsk":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 1000;
          } else {
            this.location_start_price = 1500;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Калининград" || "Another address in Kaliningrad":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 200;
          } else {
            this.location_start_price = 500;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
      }
    },
    location_end() {
      switch (this.location_end) {
        case "Офис" || "Office":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 0;
          } else {
            this.location_end_price = 400;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Аэропорт" || "Airport":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 400;
          } else {
            this.location_end_price = 700;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Зеленоградск" || "Zelenogradsk":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 800;
          } else {
            this.location_end_price = 1300;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Светлогорск" || "Svetlogorsk":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 1000;
          } else {
            this.location_end_price = 1500;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
        case "Калининград" || "Another address in Kaliningrad":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 200;
          } else {
            this.location_end_price = 500;
          }
          if (
            this.additional_hours > 0 &&
            this.additional_hours * this.prices[5] >= this.price
          ) {
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          }
          break;
      }
    },
    baby_chair() {
      if (this.baby_chair === true) {
        this.baby_chair_price = 500;
        this.total =
          this.days * this.price +
          this.additional_hours * this.prices[5] +
          this.baby_chair_price +
          this.navigator_price +
          this.location_start_price +
          this.location_end_price;
      } else {
        this.baby_chair_price = 0;
        this.total =
          this.days * this.price +
          this.additional_hours * this.prices[5] +
          this.baby_chair_price +
          this.navigator_price +
          this.location_start_price +
          this.location_end_price;
      }
    },
    navigator() {
      if (this.navigator === true) {
        this.navigator_price = 500;
        this.total =
          this.days * this.price +
          this.additional_hours * this.prices[5] +
          this.baby_chair_price +
          this.navigator_price +
          this.location_start_price +
          this.location_end_price;
      } else {
        this.navigator_price = 0;
        this.total =
          this.days * this.price +
          this.additional_hours * this.prices[5] +
          this.baby_chair_price +
          this.navigator_price +
          this.location_start_price +
          this.location_end_price;
      }
    },
  },
  methods: {
    openDialog() {
      this.$modal.show("my-first-modal");
    },
    closeDialog() {
      this.$modal.hide("my-first-modal");
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
  computed: {
    start_date () {
      return `${this.start_date_no_time} ${this.start_time}`
    },
    end_date () {
      return `${this.end_date_no_time} ${this.end_time}`
    }
  },
  validations: {
    name: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(15),
    },
    middlename: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(15),
    },
    lastname: {
      required,
      minLength: minLength(2),
      maxLength: maxLength(15),
    },
    email: {
      required,
      email,
    },
    phone: {
      required,
      minLength: minLength(5),
      maxLength: maxLength(20),
    },
  },
  components: {
    flatPickr,
    TheMask,
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
.error-input {
  background-color: #fce4e4;
  border: 1px solid #cc0033;
  outline: none;
}
</style>
