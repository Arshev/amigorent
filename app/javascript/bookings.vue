<template>
  <div id="bookings">
    <loading
      :active.sync="isLoading"
      :is-full-page="true"
      color="#1976d2"
    ></loading>
    <div class="bookings">
      <a class="arend" v-if="locale && locale == 'en'" @click="openDialog()"
        >Book Now</a
      >
      <a class="arend" v-else @click="openDialog()">Забронировать</a>

      <modal
        name="my-first-modal"
        :scrollable="false"
        :adaptive="true"
        :width="1466"
        height="auto"
        :reset="true"
      >
        <div class="content" v-if="locale && locale == 'en'">
          <div class="wrapper">
            <div style="text-align: right">
              <a class="modal-close-button" @click="closeDialog()"> Close </a>
            </div>
            <div class="page_zakaz">
              <div class="zagol" style="font-size: 30px; line-height: 30px">
                Car Booking
              </div>
              <div class="pol1">
                <div class="zag">Start Date</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="start_date_no_time"
                      placeholder="Start Date"
                      :config="configStart"
                      @input="
                        checkFree(start_date, end_date, days),
                          (start_date_error = false)
                      "
                      class="inp1"
                    ></flat-pickr>
                    <span style="color: tomato" v-if="start_date_error">
                      - fill in the date and time</span
                    >
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="start_time"
                      :config="configTime"
                      @input="checkFree(start_date, end_date, days)"
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
                <div class="zag">End date</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="end_date_no_time"
                      placeholder="End date"
                      :config="configEnd"
                      @input="
                        checkFree(start_date, end_date, days),
                          (end_date_error = false)
                      "
                      class="inp1"
                    ></flat-pickr>
                    <span style="color: tomato" v-if="end_date_error">
                      - fill in the date and time</span
                    >
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="end_time"
                      :config="configTime"
                      class="inp2"
                      @input="checkFree(start_date, end_date, days)"
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
                <div class="zag">Personal data</div>
                <div class="obo">
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.lastname.$model"
                      type="text"
                      @input="lastname_error = false"
                      :placeholder="
                        locale == 'en' ? 'Input last name' : 'Last Name'
                      "
                      name=""
                      :class="{ 'error-input': lastname_error }"
                    />
                    <span style="color: tomato" v-if="!$v.lastname.minLength">
                      - should contain max
                      {{ $v.lastname.$params.minLength.min }} letters</span
                    >
                    <span style="color: tomato" v-if="!$v.lastname.maxLength">
                      - should contain at least
                      {{ $v.lastname.$params.maxLength.max }} letters</span
                    >
                    <span style="color: tomato" v-if="lastname_error">
                      - fill in the last name</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.name.$model"
                      type="text"
                      @input="name_error = false"
                      placeholder="First Name"
                      name=""
                    />
                    <span style="color: tomato" v-if="!$v.name.minLength">
                      - should contain max
                      {{ $v.name.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.name.maxLength">
                      - should contain at least
                      {{ $v.name.$params.maxLength.max }} букв</span
                    >
                    <span style="color: tomato" v-if="name_error">
                      - fill in the name</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.middlename.$model"
                      type="text"
                      placeholder="Отчество"
                      @input="middlename_error = false"
                    />
                    <span style="color: tomato" v-if="!$v.middlename.minLength">
                      - should contain at least
                      {{ $v.middlename.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.middlename.maxLength">
                      - should contain at least
                      {{ $v.middlename.$params.maxLength.max }} букв</span
                    >
                    <span style="color: tomato" v-if="middlename_error">
                      - fill in the middlename</span
                    >
                  </div>
                  <div class="in2">
                    <the-mask
                      v-if="locale == 'ru'"
                      type="tel"
                      v-model="phone"
                      placeholder="Телефон(79111234567)"
                      v-bind:class="{ 'error-input': phone_error }"
                      :mask="['###########']"
                      @input="phone_error = false"
                    />
                    <the-mask
                      v-else
                      type="tel"
                      v-model="phone"
                      placeholder="Phone"
                      v-bind:class="{ 'error-input': phone_error }"
                      :mask="['###########', '############']"
                      @input="phone_error = false"
                    />
                    <span style="color: tomato" v-if="phone_error">
                      - wrong phone</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.email.$model"
                      placeholder="E-mail"
                      @input="email_error = false"
                    />
                    <span
                      style="color: tomato"
                      v-if="!$v.email.email || email_error"
                    >
                      - wrong Email</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-if="!showBirthday"
                      v-model="birthday"
                      @click="showBirthday = true"
                      placeholder="Birthday"
                    />
                    <flat-pickr
                      v-if="showBirthday"
                      v-model="birthday"
                      placeholder="Birthday"
                      :config="configBirthday"
                    ></flat-pickr>
                    <!-- <input
                      v-model="birthday"
                      type="date"
                      placeholder="Birthday"
                    /> -->
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Additional Information</div>
                <div class="obo">
                  <div class="in24" style="padding-bottom: 10px">
                    <input
                      v-model="description"
                      placeholder="Note and other wishes"
                    />
                  </div>
                  The possibility of delivery outside working hours, check with
                  our managers. Delivery and acceptance of a car at the office
                  during non-working hours time from 19-00 to 9-00 is 400
                  rubles. Issuance and acceptance car in the city outside of
                  working hours from 19-00 to 9-00 is 500 rubles. Delivery and
                  collection of a car at the airport in non-working hours from
                  19-00 to 9-00 is 700 rubles.

                  <div class="clear"></div>
                </div>
              </div>
              <div class="pol2">
                <div class="zag">{{ car_name }}</div>
                <div
                  class="bl_img"
                  :style="`background-image: url(${image_link})`"
                ></div>
                <div class="pod">Equipment:</div>
                <label>
                  <input v-model="baby_chair" type="checkbox" name="" />
                  <i>Baby chair</i>
                  <span>+ 500 ₽</span>
                </label>
                <label>
                  <input v-model="navigator" type="checkbox" name="" />
                  <i>GPS navigator</i>
                  <span>+ 500 ₽</span>
                </label>
                <div class="pod">Payment:</div>
                <hr style="margin: 15px 0px" />
                <div
                  class="price"
                  v-if="days != `Минимум ${booking_limit} суток`"
                >
                  Rental cost ({{ days }} суток):
                  <span>{{ price * days }} ₽</span>
                </div>
                <div class="price" v-else>
                  Rental cost:
                  <span>Min {{ booking_limit }} days</span>
                </div>
                <div class="price">
                  Add. Hours ({{ additional_hours }} ч):
                  <span>{{ additional_hours * prices[5] }} ₽</span>
                </div>
                <div class="price">
                  Add. equipment:
                  <span>{{ baby_chair_price + navigator_price }} ₽</span>
                </div>
                <div class="price">
                  Delivery / return:
                  <span>{{ location_start_price + location_end_price }} ₽</span>
                </div>
                <div class="price">
                  Deposit: <span>{{ prices[6] }} ₽</span>
                </div>
                <hr style="margin: 15px 0px" />
                <div class="price total">
                  Total:
                  <span v-if="total > 0"
                    >{{ total }} + {{ prices[6] }} <small>deposit</small></span
                  >
                </div>
              </div>
              <div class="clear"></div>
              <div class="obol2">
                <div class="ch1">
                  <label>
                    <input
                      v-model="term"
                      type="checkbox"
                      @input="terms_error = false"
                    />

                    I confirm that I have read
                    <a href="/terms" target="_blank">lease terms</a> and give
                    consent to the processing of personal data, according to
                    <a
                      href="https://base.garant.ru/12148567/"
                      target="_blank"
                      rel="nofollow"
                      >152-ФЗ</a
                    >
                  </label>
                  <span style="color: tomato" v-if="terms_error">
                    - please accept the terms</span
                  >
                  <!-- <label>
                    <input type="checkbox" value="" name="" />
                    Я соглашаюсь с уловиями политики
                    конфиденциальности
                  </label> -->
                </div>
                <button @click="sendBooking()">Send</button>
                <div class="clear"></div>
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
        <div class="content" v-else>
          <div class="wrapper">
            <div style="text-align: right">
              <a class="modal-close-button" @click="closeDialog()"> Закрыть </a>
            </div>
            <div class="page_zakaz">
              <div class="zagol" style="font-size: 30px; line-height: 30px">
                Бронирование автомобиля
              </div>
              <div class="pol1">
                <div class="zag">Начало аренды</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="start_date_no_time"
                      placeholder="Дата начала"
                      :config="configStart"
                      @input="
                        checkFree(start_date, end_date, days),
                          (start_date_error = false)
                      "
                      class="inp1"
                    ></flat-pickr>
                    <span style="color: tomato" v-if="start_date_error">
                      - заполните дату и время</span
                    >
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="start_time"
                      :config="configTime"
                      @input="checkFree(start_date, end_date, days)"
                      class="inp2"
                    ></flat-pickr>
                  </div>
                  <div class="in1">
                    <select v-if="locale == 'en'" v-model="location_start">
                      <option value="Офис" style="color: black">
                        Office (free)
                      </option>
                      <option
                        v-for="location in locations_en"
                        :key="location.index"
                        style="color: black"
                      >
                        {{ location }}
                      </option>
                    </select>
                    <select v-else v-model="location_start">
                      <option value="Офис" style="color: black">
                        Офис (бесплатно)
                      </option>
                      <option
                        v-for="location in locations"
                        :key="location.index"
                        style="color: black"
                      >
                        {{ location }}
                      </option>
                    </select>
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Окончание аренды</div>
                <div class="obo">
                  <div class="in1">
                    <flat-pickr
                      v-model="end_date_no_time"
                      placeholder="Дата возврата"
                      :config="configEnd"
                      @input="
                        checkFree(start_date, end_date, days),
                          (end_date_error = false)
                      "
                      class="inp1"
                    ></flat-pickr>
                    <span style="color: tomato" v-if="end_date_error">
                      - заполните дату и время</span
                    >
                  </div>
                  <div class="in1">
                    <flat-pickr
                      v-model="end_time"
                      :config="configTime"
                      class="inp2"
                      @input="checkFree(start_date, end_date, days)"
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
                      @input="lastname_error = false"
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
                    <span style="color: tomato" v-if="lastname_error">
                      - заполните фамилию</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.name.$model"
                      type="text"
                      @input="name_error = false"
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
                    <span style="color: tomato" v-if="name_error">
                      - заполните имя</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.middlename.$model"
                      type="text"
                      placeholder="Отчество"
                      @input="middlename_error = false"
                    />
                    <span style="color: tomato" v-if="!$v.middlename.minLength">
                      - должно содержать минимум
                      {{ $v.middlename.$params.minLength.min }} буквы</span
                    >
                    <span style="color: tomato" v-if="!$v.middlename.maxLength">
                      - должно содержать максимум
                      {{ $v.middlename.$params.maxLength.max }} букв</span
                    >
                    <span style="color: tomato" v-if="middlename_error">
                      - заполните отчетсво</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-if="locale == 'ru'"
                      @maska="phone = $event.target.dataset.maskRawValue"
                      type="tel"
                      placeholder="Телефон(79111234567)"
                      v-bind:class="{ 'error-input': phone_error }"
                      v-maska="['+# (###) ##-##-###', '+# (###) ###-##-####']"
                      @input="phone_error = false"
                    />
                    <input
                      v-else
                      type="tel"
                      placeholder="Phone"
                      v-bind:class="{ 'error-input': phone_error }"
                      @maska="phone = $event.target.dataset.maskRawValue"
                      v-maska="['+# (###) #######', '+# (###) #########']"
                      @input="phone_error = false"
                    />
                    <span style="color: tomato" v-if="phone_error">
                      - неправильный телефон</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model.trim.lazy="$v.email.$model"
                      placeholder="E-mail"
                      @input="email_error = false"
                    />
                    <span
                      style="color: tomato"
                      v-if="!$v.email.email || email_error"
                    >
                      - неправильный Email</span
                    >
                  </div>
                  <div class="in2">
                    <input
                      v-model="birthday"
                      v-maska="'##.##.####'"
                      placeholder="Дата рождения"
                    />
                    <!-- <input
                      v-if="!showBirthday"
                      v-model="birthday"
                      @click="showBirthday = true"
                      placeholder="Дата рождения"
                    /> -->
                    <!-- <flat-pickr
                      v-if="showBirthday"
                      v-model="birthday"
                      placeholder="Дата рождения"
                      :config="configBirthday"
                    ></flat-pickr> -->
                  </div>
                  <div class="clear"></div>
                </div>
                <div class="zag">Дополнительная информация</div>
                <div class="obo">
                  <div class="in24" style="padding-bottom: 10px">
                    <input
                      v-model="description"
                      placeholder="Примечание и другие пожелания"
                    />
                  </div>
                  Возможность доставки в нерабочее время уточняйте у наших
                  менеджеров. Выдача и прием автомобиля в офисе в нерабочее
                  время с 19-00 до 9-00 составляет 500 руб. Выдача и прием
                  автомобиля по городу в нерабочее время с 19-00 до 9-00
                  составляет 600 руб. Выдача и прием автомобиля в аэропорту в
                  нерабочее время с 19-00 до 9-00 составляет 1000 руб.

                  <div class="clear"></div>
                </div>
              </div>
              <div class="pol2">
                <div class="zag">{{ car_name }}</div>
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
                <div class="pod">Расчёт:</div>
                <hr style="margin: 15px 0px" />
                <div class="price">
                  Аренда ({{ days }} суток): {{ price }} ₽
                  <span>{{ price * days }} ₽</span>
                </div>
                <div class="price" v-if="days_limit_error">
                  Лимит:
                  <span>{{
                    `Минимум ${free ? booking_limit : "2-e"} суток`
                  }}</span>
                </div>
                <div class="price" v-if="hours > 0">
                  Доп время ({{ additional_hours }} ч):
                  <span>{{ additional_hours * prices[5] }} ₽</span>
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
                <hr style="margin: 15px 0px" />
                <div class="price total">
                  Итого:
                  <span v-if="total > 0"
                    >{{ total }} + {{ prices[6] }} <small>залог</small></span
                  >
                </div>
              </div>
              <div class="clear"></div>
              <div class="obol2">
                <div class="ch1">
                  <label>
                    <!-- <input
                      v-model="term"
                      type="checkbox"
                      class="my_checkbox"
                      @input="terms_error = false"
                    /> -->

                    Нажимая кнопку "Отправить" я подтверждаю, что ознакомился с
                    <a href="/terms" target="_blank">условиями аренды</a> и даю
                    согласие на обработку персональных данных, согласно
                    <a
                      href="https://base.garant.ru/12148567/"
                      target="_blank"
                      rel="nofollow"
                      >152-ФЗ</a
                    >
                  </label>
                  <!-- <span style="color: tomato" v-if="terms_error">
                    - пожалуйста примите условия</span
                  > -->
                </div>
                <button @click="sendBooking()">Отправить</button>
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
    link_params: {
      type: Object,
    },
    ids_rentprog: {
      type: Array,
    },
    car_name: {
      type: String,
    },
    rentprog_token: {
      type: String,
    },
    booking_limit: {
      type: Number,
    },
    locale: {
      type: String,
    },
  },
  data: function () {
    return {
      price: 0,
      rentprog_price: 0,
      days: 0,
      days_limit_error: null,
      total: 0,
      additional_hours: 0,
      hours_limit: 0,
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
      free_ids: [],
      free: false,
      configStart: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: "today",
      },
      configBirthday: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "Y-m-d",
        maxDate: "today",
      },
      showBirthday: false,
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
      birthday: null,
      description: null,
      baby_chair_price: 0,
      navigator_price: 0,
      location_start_price: 0,
      location_end_price: 0,
      term: false,
      start_date_error: false,
      end_date_error: false,
      name_error: false,
      middlename_error: false,
      lastname_error: false,
      email_error: false,
      phone_error: false,
      terms_error: false,
      days_error: false,
      isLoading: false,
    };
  },
  created() {
    if (
      this.link_params &&
      this.link_params.start_date &&
      this.link_params.start_time &&
      this.link_params.end_date &&
      this.link_params.end_time &&
      this.link_params.free
    ) {
      this.start_date_no_time = this.link_params.start_date;
      this.end_date_no_time = this.link_params.end_date;
      this.start_time = this.link_params.start_time;
      this.end_time = this.link_params.end_time;
      this.free = this.link_params.free == "true" ? true : false;
      if (
        this.ids_rentprog &&
        this.ids_rentprog.length > 0 &&
        this.start_date &&
        this.end_date &&
        this.start_date_no_time &&
        this.end_date_no_time
      ) {
        this.getCarData(this.ids_rentprog[0], false);
      }
    }
  },
  watch: {
    end_date() {
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      let end_date = moment(this.end_date, "DD-MM-YYYY H:mm");
      let hours = moment.duration(end_date.diff(start_date)).asHours();
      console.log("hours", hours);

      let start_date_days = moment(this.start_date, "DD-MM-YYYY");
      let end_date_days = moment(this.end_date, "DD-MM-YYYY");
      this.additional_hours = 0;
      let additionalHours = 0;
      if (
        hours >
        moment.duration(end_date_days.diff(start_date_days)).asDays() * 24
      ) {
        this.hours = hours;
        additionalHours = hours % 24;
        this.additional_hours = Math.trunc(additionalHours);
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();
      // Если есть id с рентпрога, то считаем по нему и делаем запрос на цену
      if (
        this.ids_rentprog &&
        this.ids_rentprog.length > 0 &&
        this.start_date &&
        this.end_date &&
        this.start_date_no_time &&
        this.end_date_no_time
      ) {
        this.getCarData(this.ids_rentprog[0], true);
      }
      if (!isNaN(diff)) {
        if (diff >= 1) {
          this.days = diff;
        }
        // Если машина свободная
        if (this.free) {
          if (diff < this.booking_limit) {
            this.days = diff;
            this.days_limit_error = `Минимум ${this.booking_limit} суток`;
          } else {
            this.days_limit_error = null;
          }
        } else {
          if (diff < 2) {
            this.days = diff;
            this.days_limit_error = `Минимум 2-е суток`;
          } else {
            this.days_limit_error = null;
          }
        }

        if (diff >= 1 && diff <= 3) {
          if (
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            console.log("this.days 1", this.days);
            this.additional_hours = 0;
            this.hours = 0;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[0];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            console.log("this.days 2", this.days);
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[0];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            this.additional_hours = 0;
            this.hours = 0;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[1];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[1];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            this.hours = 0;
            this.additional_hours = 0;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[2];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[2];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            this.hours = 0;
            this.additional_hours = 0;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[3];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[3];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            this.hours = 0;
            this.additional_hours = 0;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[4];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[4];
            }
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
      this.errors = [];
    },
    start_date() {
      // Минимаьная дата в календаре
      if (this.start_date_no_time) {
        this.configEnd.minDate = moment(
          this.start_date_no_time,
          "DD-MM-YYYY"
        ).toDate();
      }
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      let end_date = moment(this.end_date, "DD-MM-YYYY H:mm");

      let hours = moment.duration(end_date.diff(start_date)).asHours();

      let start_date_days = moment(this.start_date, "DD-MM-YYYY");
      let end_date_days = moment(this.end_date, "DD-MM-YYYY");
      this.additional_hours = 0;
      let additionalHours = 0;
      if (
        hours >
        moment.duration(end_date_days.diff(start_date_days)).asDays() * 24
      ) {
        this.hours = hours;
        additionalHours = hours % 24;
        this.additional_hours = Math.trunc(additionalHours);
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();
      // Если есть id с рентпрога, то считаем по нему и делаем запрос на цену
      if (
        this.ids_rentprog &&
        this.ids_rentprog.length > 0 &&
        this.start_date &&
        this.end_date &&
        this.start_date_no_time &&
        this.end_date_no_time
      ) {
        this.getCarData(this.ids_rentprog[0], true);
      }

      if (!isNaN(diff)) {
        if (diff >= 1) {
          this.days = diff;
        }
        // Если машина свободная
        if (this.free) {
          if (diff < this.booking_limit) {
            this.days = diff;
            this.days_limit_error = `Минимум ${this.booking_limit} суток`;
          } else {
            this.days_limit_error = null;
          }
        } else {
          if (diff < 2) {
            this.days = diff;
            this.days_limit_error = `Минимум 2-е суток`;
          } else {
            this.days_limit_error = null;
          }
        }
        if (diff >= 1 && diff <= 3) {
          if (
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            console.log("this.days 1", this.days);
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[0];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            console.log("this.days 2", this.days);
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[0];
            }
            this.total =
              this.days * this.price +
              this.additional_hours * this.prices[5] +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;

            console.log("this.total", this.total);
          }
        }
        if (diff > 3 && diff <= 7) {
          if (
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[1];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[1];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[2];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[2];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[3];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[3];
            }
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
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            this.days = diff + 1;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[4];
            }
            this.total =
              this.days * this.price +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
          } else {
            this.days = diff;
            if (this.rentprog_price && this.rentprog_price > 0) {
              this.price = this.rentprog_price;
            } else {
              this.price = this.prices[4];
            }
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
      this.errors = [];
    },
    location_start() {
      let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
      switch (this.location_start) {
        case "Офис" || "Office":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 0;
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
        case "Аэропорт" || "Airport":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 500;
          } else {
            this.location_start_price = 1000;
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
        case "Светлогорск" || "Svetlogorsk":
          if (moment(this.start_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_start_price = 1500;
          } else {
            this.location_start_price = 2000;
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
            this.location_start_price = 300;
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
        case "Аэропорт" || "Airport":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 500;
          } else {
            this.location_end_price = 1000;
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
        case "Светлогорск" || "Svetlogorsk":
          if (moment(this.end_date, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.location_end_price = 1500;
          } else {
            this.location_end_price = 2000;
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
            this.location_end_price = 300;
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
    birthday() {
      console.log(this.birthday);
    },
    days() {
      console.log(this.days);
    },
  },
  methods: {
    openDialog() {
      if (
        this.ids_rentprog &&
        this.ids_rentprog.length > 0 &&
        this.start_date &&
        this.end_date &&
        this.start_date_no_time &&
        this.end_date_no_time
      ) {
        this.getCarData(this.ids_rentprog[0], false);
        this.$modal.show("my-first-modal");
      } else {
        this.$modal.show("my-first-modal");
      }
      this.checkFree(this.start_date, this.end_date, this.days);
    },
    closeDialog() {
      this.$modal.hide("my-first-modal");
    },
    checkFree(start_date, end_date, days) {
      if (
        start_date &&
        end_date &&
        days > 0 &&
        this.free &&
        this.ids_rentprog &&
        this.ids_rentprog.length > 0
      ) {
        this.isLoading = true;
        let self = this;
        this.axios
          .post(
            `/api/v1/free_cars`,
            {
              start_date: start_date,
              end_date: end_date,
              days: days,
            },
            {
              headers: {
                Authorization: `Bearer ${this.rentprog_token}`,
              },
            }
          )
          .then((response) => {
            // Получаем свободные ids
            let free_ids = response.data;
            this.free_ids = free_ids;
            if (!this.ids_rentprog.some((e) => free_ids.includes(e))) {
              this.$swal({
                type: "warning",
                title: "Автомобиль занят!",
                text: "К сожалению на эти даты автомобиль занят, попробуйте выбрать другие или свяжитесь с нами",
              });
            }
            if (window["ym"]) {
              console.log("search_cars_metrika", 48045371);
              window["ym"](
                48045371,
                "reachGoal",
                "search_cars",
                {
                  start_date: this.start_date,
                  end_date: this.end_date,
                },
                () => {
                  console.log("search_cars_metrika success");
                },
                (err) => {
                  console.log("search_cars_metrika error", err);
                }
              );
            } else {
              console.log("search_cars_metrika not found");
            }
          })
          .catch((error) => {
            this.isLoading = false;
            this.$swal({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              type: "error",
              title: "Ошибка при проверке занятости авто!",
              text: error,
            });
          })
          .finally((this.isLoading = false));
      }
    },
    getCarData(id, from_calendar) {
      this.isLoading = true;
      this.axios
        .get(
          `/api/v1/amigorent_car_data/${id}?start_date=${this.start_date}&end_date=${this.end_date}`,
          {
            headers: {
              Authorization: `Bearer ${this.rentprog_token}`,
            },
          }
        )
        .then((response) => {
          console.log(response.data);
          this.rentprog_price = response.data.selected_price;
          this.hours_limit = response.data.hours_limit;
          // Расчет стоимости доп часов
          let calc_hours_cost = 0;
          let start_date = moment(this.start_date, "DD-MM-YYYY H:mm");
          let end_date = moment(this.end_date, "DD-MM-YYYY H:mm");

          let hours = moment.duration(end_date.diff(start_date)).asHours();

          let start_date_days = moment(this.start_date, "DD-MM-YYYY");
          let end_date_days = moment(this.end_date, "DD-MM-YYYY");
          let diff = moment
            .duration(end_date_days.diff(start_date_days))
            .asDays();
          this.additional_hours = 0;
          let additionalHours = 0;
          if (
            hours >
            moment.duration(end_date_days.diff(start_date_days)).asDays() * 24
          ) {
            this.hours = hours;
            additionalHours = hours % 24;
            this.additional_hours = Math.trunc(additionalHours);
          }
          if (
            additionalHours > 0 &&
            (additionalHours * this.prices[5] >= this.price ||
              additionalHours >= this.hours_limit)
          ) {
            // if (!from_calendar) {
            this.days = diff + 1;
            // }
            this.additional_hours = 0;
          } else if (this.additional_hours > 0) {
            calc_hours_cost = this.additional_hours * response.data.price_hour;
          }
          // if (
          //   this.additional_hours > 0 &&
          //   this.additional_hours < this.hours_limit
          // ) {
          //   calc_hours_cost = this.additional_hours * response.data.price_hour;
          // } else if (this.additional_hours >= this.hours_limit) {
          //   this.days = this.days + 1;
          //   this.additional_hours = 0;
          // }
          // console.log(this.additional_hours, this.hours_limit);
          if (this.rentprog_price && this.rentprog_price > 0) {
            this.price = this.rentprog_price;
            this.total =
              this.days * this.price +
              calc_hours_cost +
              this.baby_chair_price +
              this.navigator_price +
              this.location_start_price +
              this.location_end_price;
            document.getElementById(
              "price"
            ).innerHTML = `<b><span>${this.rentprog_price}</span> ₽/сутки</b>`;
            document.getElementById("price").style =
              "text-align: center; margin-top: 30px;";
            document.getElementById("price_title").style = `display: none`;
            document.getElementById("price_table").style = `display: none`;
          }
        })
        .catch((error) => {
          this.isLoading = false;
          this.$swal({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            type: "error",
            title: "Ошибка при проверке занятости авто!",
            text: error,
          });
        })
        .finally((this.isLoading = false));
    },
    sendBooking() {
      let self = this;
      let has_error = false;
      if (this.name === "" || this.name == null) {
        this.name_error = true;
        has_error = true;
      }
      if (this.middlename === "" || this.middlename == null) {
        this.middlename_error = true;
        has_error = true;
      }
      if (this.lastname === "" || this.lastname == null) {
        this.lastname_error = true;
        has_error = true;
      }
      if (this.email === "" || !this.$v.email.email || this.email == null) {
        this.email_error = true;
        has_error = true;
      }
      if (this.phone === "" || !this.$v.phone.minLength || this.phone == null) {
        this.phone_error = true;
        has_error = true;
      }
      if (this.start_date === "" || this.start_date == null) {
        this.start_date_error = true;
        has_error = true;
      }
      if (this.end_date === "" || this.end_date == null) {
        this.end_date_error = true;
        has_error = true;
      }
      // if (this.term === false) {
      //   this.terms_error = true;
      //   has_error = true;
      // }

      function send() {
        self.isLoading = true;
        if (!has_error) {
          if (
            !self.name_error &&
            !self.middlename_error &&
            !self.lastname_error &&
            !self.email_error &&
            !self.phone_error &&
            !self.start_date_error &&
            !self.end_date_error &&
            !self.terms_error
          ) {
            if (
              self.start_date &&
              self.end_date &&
              self.name &&
              self.lastname &&
              self.phone
            ) {
              // Отсылаю только свободные ids
              let free_cars_ids = [];
              if (
                self.ids_rentprog &&
                self.ids_rentprog.length > 0 &&
                self.ids_rentprog.some((e) => self.free_ids.includes(e))
              ) {
                self.ids_rentprog.forEach((id) => {
                  if (self.free_ids.includes(id)) {
                    free_cars_ids.push(id);
                  }
                });
              }
              self.axios
                .post(
                  `/api/v1/amigorent_new_booking`,
                  {
                    name: self.name,
                    lastname: self.lastname,
                    middlename: self.middlename,
                    fio:
                      self.name &&
                      self.name.length > 0 &&
                      self.middlename &&
                      self.middlename.length > 0 &&
                      self.lastname &&
                      self.lastname.length > 0
                        ? `${self.name[0].toUpperCase()}. ${self.middlename[0].toUpperCase()} ${
                            self.lastname
                          }`
                        : null,
                    phone: self.phone,
                    email: self.email,
                    ids_rentprog: free_cars_ids,
                    car_name: self.car_name,
                    price: self.price,
                    start_date: self.start_date,
                    end_date: self.end_date,
                    days: self.days,
                    location_start: self.location_start,
                    location_end: self.location_end,
                    additional_hours: self.additional_hours,
                    rental_cost: self.days * self.price,
                    hours_cost:
                      self.hours > 0
                        ? self.additional_hours * self.prices[5]
                        : 0,
                    price_hour: self.prices[5],
                    delivery: self.location_start_price,
                    delivery_end: self.location_end_price,
                    equipment: self.baby_chair_price + self.navigator_price,
                    total: self.total,
                    deposit: self.prices[6],
                    chair: self.baby_chair,
                    navigator: self.navigator,
                    birthday: self.birthday
                      ? moment(self.birthday, "DD.MM.YYYY").format("YYYY-MM-DD")
                      : null,
                    description: self.description,
                    booking_limit: self.booking_limit,
                  },
                  {
                    headers: {
                      Authorization: `Bearer ${self.rentprog_token}`,
                    },
                  }
                )
                .then(() => {
                  if (window["ym"]) {
                    console.log("send_booking_metrika", 48045371);
                    window["ym"](
                      48045371,
                      "reachGoal",
                      "send_booking",
                      {
                        start_date: self.start_date,
                        end_date: self.end_date,
                      },
                      () => {
                        console.log("send_booking_metrika success");
                      },
                      (err) => {
                        console.log("send_booking_metrika error", err);
                      }
                    );
                  } else {
                    console.log("send_booking_metrika not found");
                  }
                  // self.closeDialog();
                  // self.$swal({
                  //   type: "success",
                  //   title: "Заявка отправлена!",
                  //   text: `Обращаем ваше внимание, что оформление заявки не является бронированием!
                  //     По результатам обработки заявки, ответ придет на вашу электронную почту или WhatsApp.
                  //     (не забудьте проверить нежелательную почту)`,
                  // });
                  // self.isLoading = false
                  window.location.replace(
                    self.locale == "en" ? `/en/success` : `/success`
                  );
                })
                .catch((error) => {
                  self.$swal({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    type: "error",
                    title: "Ошибка при отправке!",
                    text: error,
                  });
                })
                .finally((self.isLoading = false));
            } else {
              self.isLoading = false;
              self.$swal({
                type: "warning",
                title: "Ошибка при отправке!",
                text: "Пожалуйста заполните обязательные поля",
              });
            }
          } else {
            self.isLoading = false;
            self.$swal({
              type: "warning",
              title: "Ошибка при отправке!",
              text: "Пожалуйста исправьте ошибки",
            });
          }
        } else {
          self.isLoading = false;
          self.$swal({
            type: "error",
            title: "Ошибка!",
            text: "Пожалуйста заполните все поля",
            position: "center",
            showConfirmButton: true,
            confirmButtonText: "Ок",
          });
        }
      }
      if (this.days < 2) {
        this.$swal({
          type: "warning",
          title: "Внимание!",
          text: `Минимальный срок аренды 2-е суток. Вы можете отправить заявку, но решение о возможности бронирования на срок меньше минимального принимает менеджер.`,
          showCancelButton: true,
          confirmButtonText: "Отправить",
          cancelButtonText: "Закрыть",
          showCloseButton: true,
        }).then((result) => {
          if (result.value) {
            send();
          }
        });
      } else {
        send();
      }
    },
  },
  computed: {
    start_date() {
      return `${this.start_date_no_time} ${this.start_time}`;
    },
    end_date() {
      return `${this.end_date_no_time} ${this.end_time}`;
    },
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
