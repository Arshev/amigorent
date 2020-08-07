<template>
  <div id="app">
    <div class="pol1">
      <div class="zg" v-if="locale=='en'">Selected car</div>
      <div class="zg" v-else >Выбранный автомобиль</div>
        <template v-if="carId === ''">
            <select v-model="carName" class="select_booking_form">
              <option class="select_booking_form" disabled value="" v-if="locale=='en'" >Select car</option>
              <option class="select_booking_form" disabled value="" v-else >Выберите автомобиль</option>
              <option v-for="name in carNames" :key="name.index" class="select_booking_form">{{ name }}</option>
            </select>
          </template>
          <template v-else>
            <select class="select_booking_form" disabled >
              <option selected :value="carNameWithId" >{{carNameWithId}}</option>
            </select>
          </template>
      <div class="cha2">
          <div class="zg" v-if="locale=='en'">Lastname<span>*</span></div>
          <div class="zg" v-else >Фамилия<span>*</span></div>
          <span style="color: tomato;" v-if="!$v.lastnameClient.minLength"> - должна содержать минимум {{$v.lastnameClient.$params.minLength.min}} буквы</span>
          <span style="color: tomato;" v-if="!$v.lastnameClient.minLength"> - должна содержать минимум {{$v.lastnameClient.$params.minLength.min}} буквы</span>
          <input v-if="locale=='en'" v-model.trim.lazy="$v.lastnameClient.$model" placeholder="Input lastname" v-bind:class="{ 'error-input': lastnameError }" >
          <input v-else v-model.trim.lazy="$v.lastnameClient.$model" placeholder="Введите фамилию" v-bind:class="{ 'error-input': lastnameError }" >
      </div>
      <div class="cha2">
          <div class="zg" v-if="locale=='en'">Name<span>*</span></div>
          <div class="zg" v-else >Имя<span>*</span></div>
          <span style="color: tomato;" v-if="!$v.nameClient.minLength"> - должно содержать минимум {{$v.nameClient.$params.minLength.min}} буквы</span>
          <span style="color: tomato;" v-if="!$v.nameClient.maxLength"> - должно содержать максимум {{$v.nameClient.$params.maxLength.max}} букв</span>
          <input type="text" v-if="locale=='en'" v-model.trim.lazy="$v.nameClient.$model" placeholder="Input name" v-bind:class="{ 'error-input': nameError }" required>
          <input type="text" v-else v-model.trim.lazy="$v.nameClient.$model" placeholder="Введите имя" v-bind:class="{ 'error-input': nameError }" required>
      </div>
      <div class="cha2">
          <div class="zg" v-if="locale=='en'">Middlename<span>*</span></div>
          <div class="zg" v-else >Отчество<span>*</span></div>
          <span style="color: tomato;" v-if="!$v.middlenameClient.minLength"> - должно содержать минимум {{$v.middlenameClient.$params.minLength.min}} буквы</span>
          <span style="color: tomato;" v-if="!$v.middlenameClient.maxLength"> - должно содержать максимум {{$v.middlenameClient.$params.maxLength.max}} букв</span>
          <input type="text" v-if="locale=='en'" v-model.trim.lazy="$v.middlenameClient.$model" placeholder="Input middlename" v-bind:class="{ 'error-input': middlenameError }" required>
          <input type="text" v-else v-model.trim.lazy="$v.middlenameClient.$model" placeholder="Введите отчество" v-bind:class="{ 'error-input': middlenameError }" required>
      </div>
      <div class="clear"></div>
      <div class="cha1">
          <div class="zg">Email<span>*</span></div>
          <span style="color: tomato;" v-if="!$v.emailClient.email"> - неправильный Email</span>
          <input v-if="locale=='en'" v-model.trim.lazy="$v.emailClient.$model" placeholder="Input email" v-bind:class="{ 'error-input': emailError }" >
          <input v-else v-model.trim.lazy="$v.emailClient.$model" placeholder="Введите email" v-bind:class="{ 'error-input': emailError }" >
      </div>
      <div class="cha1">
          <div class="zg" v-if="locale=='en'" >Phone<span>*</span></div>
          <div class="zg" v-else >Телефон<span>*</span></div>
          <!-- <span style="color: tomato;" v-if="!$v.phoneClient.minLength"> - неправильный телефон</span>
          <input v-if="locale=='en'" v-model.trim.lazy="$v.phoneClient.$model" type="tel" placeholder="Input phone" class="form-control" v-bind:class="{ 'error-input': phoneError }">
          <input v-else v-model.trim.lazy="$v.phoneClient.$model" type="tel" placeholder="Введите телефон" class="form-control" v-bind:class="{ 'error-input': phoneError }"> -->
          <the-mask v-if="locale=='ru'" type="tel" v-model="phoneClient" placeholder="Введите телефон, формат 79111111111" class="form-control" v-bind:class="{ 'error-input': phoneError }" :mask="['###########']" />
          <the-mask v-else type="tel" v-model="phoneClient" placeholder="Input phone, format 79111111111" class="form-control" v-bind:class="{ 'error-input': phoneError }" :mask="['###########', '############']" />
      </div>
      <div class="clear"></div>
      <div class="cha1">
          <div class="zg" v-if="locale=='en'" >Date and time of rental start<span>*</span></div>
          <div class="zg" v-else >Дата и время начала аренды<span>*</span></div>
          <flat-pickr v-if="locale=='en'" v-model="dateStart" :config="configStart" placeholder="Date and time of rental start" id="startDate" v-bind:class="{ 'error-input': dateStartError }"></flat-pickr>
          <flat-pickr v-else v-model="dateStart" :config="configStart" placeholder="Дата и время начала аренды" id="startDate" v-bind:class="{ 'error-input': dateStartError }"></flat-pickr>
      </div>
      <div class="cha1">
          <div class="zg" v-if="locale=='en'" >Rental end<span>*</span></div>
          <div class="zg" v-else >Окончание аренды<span>*</span></div>
          <flat-pickr v-if="locale=='en'" v-model="dateEnd" :config="configEnd" placeholder="Date and time of rental end" required></flat-pickr>
          <flat-pickr v-else v-model="dateEnd" :config="configEnd" placeholder="Дата и время окончания аренды" required></flat-pickr>

      </div>
      <div class="clear"></div>
      <div class="cha1">
          <div class="zg" v-if="locale=='en'" >Place of car<span>*</span></div>
          <div class="zg" v-else >Место получения авто<span>*</span></div>
          <select v-if="locale=='en'" v-model="locationStart" class="select_booking_form" >
            <option value="Офис">Office (free)</option>
            <option v-for="location in locations_en" :key="location.index" >{{ location }}</option>
          </select>
          <select v-else v-model="locationStart" class="select_booking_form" >
            <option value="Офис">Офис (бесплатно)</option>
            <option v-for="location in locations" :key="location.index" >{{ location }}</option>
          </select>
      </div>
      <div class="cha1">
          <div class="zg" v-if="locale=='en'" >Place of car return<span>*</span></div>
          <div class="zg" v-else >Место возврата авто<span>*</span></div>
          <select v-if="locale=='en'" v-model="locationEnd" class="select_booking_form" >
            <option value="Офис">Office (free)</option>
            <option v-for="location in locations_en" :key="location.index" >{{ location }}</option>
          </select>
          <select v-else v-model="locationEnd" class="select_booking_form" >
            <option value="Офис">Офис (бесплатно)</option>
            <option v-for="location in locations" :key="location.index" >{{ location }}</option>
          </select>
      </div>
      <div class="clear"></div>
    </div>
    <div class="pol2 sticky" v-if="locale=='en'" >
        <div class="zg">Cost</div>
        <p>Name: <span class="booking_info">{{ carName }}</span></p>
        <p>Cost (per day): <span class="booking_info"  v-if="price != null ">{{ price }} <small>rubles</small></span></p>
        <p>Total days: <span class="booking_info" >{{ days }}</span></p>
        <p v-if="(additional_hours * price_hour) > 0 && this.additional_hours * this.price_hour < this.price" >Additional hours <span class="booking_info">{{ additional_hours * price_hour }} <small>rubles</small></span></p>
        <p v-if="(locationStartPrice + locationEndPrice) > 0" >Delivery <span class="booking_info">{{ locationStartPrice + locationEndPrice }} <small>rubles</small></span></p>
        <p v-if="(babyChairPrice + navigatorPrice) > 0">Additional options <span class="booking_info">{{ babyChairPrice + navigatorPrice }} rubles</span></p>
        <p class="itogo">Total: <span class="booking_info" v-if="price != null ">{{ total }} <small>rubles</small></span></p>
        <p>Deposit: <span class="booking_info" v-if="deposit > 0">{{ deposit }} <small>rubles</small></span></p>
        <a href="" onclick="return false;" @click="sendBooking()" class="otpr">Send Booking</a>
        <ul id="errors">
          <li v-for="error in errors" :key="error.index" class="errors">{{ error }}</li>
        </ul>
    </div>
    <div class="pol2 sticky" v-else >
        <div class="zg">Стоимость</div>
        <p>Название: <span class="booking_info">{{ carName }}</span></p>
        <p>Цена (за сутки): <span class="booking_info"  v-if="price != null ">{{ price }} <small>руб</small></span></p>
        <p>Всего суток: <span class="booking_info" >{{ days }}</span></p>
        <p v-if="(additional_hours * price_hour) > 0 && this.additional_hours * this.price_hour < this.price" >Дополнительные часы <span class="booking_info">{{ additional_hours * price_hour }} <small>руб</small></span></p>
        <p v-if="(locationStartPrice + locationEndPrice) > 0" >Доставка <span class="booking_info">{{ locationStartPrice + locationEndPrice }} <small>руб</small></span></p>
        <p v-if="(babyChairPrice + navigatorPrice) > 0">Дополнительные опции <span class="booking_info">{{ babyChairPrice + navigatorPrice }} руб</span></p>
        <p class="itogo">Итого: <span class="booking_info" v-if="price != null ">{{ total }} <small>руб</small></span></p>
        <p>Залог: <span class="booking_info" v-if="deposit > 0">{{ deposit }} <small>руб</small></span></p>
        <a href="" onclick="return false;" @click="sendBooking()" class="otpr">Отправить заявку</a>
        <ul id="errors">
          <li v-for="error in errors" :key="error.index" class="errors">{{ error }}</li>
        </ul>
    </div>
    <div class="clear"></div>
    <div class="dopoln">
        <div v-if="locale=='en'" class="zg2" style="margin-bottom:10px;font-size:22px;">Additional options</div>
        <div v-else class="zg2" style="margin-bottom:10px;font-size:22px;">Дополнительные опции</div>
        <label v-if="locale=='en'">
            <input type="checkbox" id="checkbox" value=true v-model="babyChair">
            Baby chair
        </label>
        <label v-else>
            <input type="checkbox" id="checkbox" value=true v-model="babyChair">
            Детское кресло
        </label>
        <label v-if="locale=='en'">
            <input type="checkbox" id="checkbox" value=true v-model="navigator">
            GPS navigator
        </label>
        <label v-else>
            <input type="checkbox" id="checkbox" value=true v-model="navigator">
            Навигатор
        </label>
        <div v-if="locale=='en'" class="zg2" style="margin-bottom:10px; font-size:22px;">Confirm consent<span>*</span></div>
        <div v-else class="zg2" style="margin-bottom:10px; font-size:22px;">Подтвердите согласие<span>*</span></div>
        <label v-if="locale=='en'" style="background-color:rgba(232, 28, 28, 0.2);">
            <input type="checkbox" id="checkbox" value="true" v-model="termsData">
            I confirm that I have read the rental conditions: <a href="/terms" target="_blank">Terms</a>
            <br />
            <br />
            <input type="checkbox" id="checkbox" value="true" v-model="personData">
            I consent to the processing of personal data, according to <a href="https://base.garant.ru/12148567/" rel="nofollow">152-ФЗ</a>
        </label>
        <label v-else style="background-color:rgba(232, 28, 28, 0.2);">
            <input type="checkbox" id="checkbox" value="true" v-model="termsData">
            Подтверждаю, что ознакомился с условиями аренды: <a href="/terms" target="_blank">Условия</a>
            <br />
            <br />
            <input type="checkbox" id="checkbox" value="true" v-model="personData">
            Даю согласие на обработку персональных данных, согласно <a href="https://base.garant.ru/12148567/" rel="nofollow">152-ФЗ</a>
        </label>
    </div>
  </div>
</template>

<script>
import axios from "axios"
import flatPickr from 'vue-flatpickr-component'
import { Russian } from "flatpickr/dist/l10n/ru"
import ConfirmDatePlugin from 'flatpickr/dist/plugins/confirmDate/confirmDate';
import 'flatpickr/dist/flatpickr.css';
import 'flatpickr/dist/themes/airbnb.css';
import 'flatpickr/dist/plugins/confirmDate/confirmDate.css';
import { required, minLength, maxLength, email, phone } from 'vuelidate/lib/validators'
import modal from './packs/components/modal.vue'
import moment from 'moment'
import 'moment-business-time'
    import 'moment/locale/ru'
    // moment.updateLocale(localeName, config)
    moment.updateLocale('ru', {
        workinghours: {
            0: ['09:00:00', '19:00:00'],
            1: ['09:00:00', '19:00:00'],
            2: ['09:00:00', '19:00:00'],
            3: ['09:00:00', '19:00:00'],
            4: ['09:00:00', '19:00:00'],
            5: ['09:00:00', '19:00:00'],
            6: ['09:00:00', '19:00:00']
        }
    });

flatpickr.localize(Russian);
import {TheMask} from 'vue-the-mask'

export default {
  props: ["locale"],
  data: function() {
    return {
      cars: [],
      carsArr: [],
      carNames: [],
      carId: '',
      carNameWithId: '',
      carName: '',
      price_1: '',
      price_2: '',
      price_3: '',
      price_4: '',
      price_5: '',
      price_hour: '',
      babyChair: false,
      navigator: false,
      babyChairPrice: 0,
      navigatorPrice: 0,
      days: null,
      nameClient: '',
      middlenameClient: '',
      lastnameClient: '',
      emailClient: '',
      phoneClient: '',
      dateStart: null,
      configStart: {
          altFormat: 'j M H:i',
          enableTime: true,
          altInput: true,
          dateFormat: 'd-m-Y H:i',
          minDate: "today",
          time_24hr: true,
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateStart = dateObj[0]
          }  
        },
      dateEnd: null,
      configEnd: {
          altFormat: 'j M H:i',
          enableTime: true,
          altInput: true,
          dateFormat: 'd-m-Y H:i',
          minDate: "today",
          time_24hr: true,
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateEnd = dateObj[0]
          }
        },
      additional_hours: 0,
      hours: 0,
      personData: false,
      termsData: false,
      errors: [],
      locations: [
        'Аэропорт', 
        'Светлогорск', 
        'Зеленоградск', 
        'Другой адрес в Калининграде',
        'Офис'
      ],
      locations_en: [
        'Airport', 
        'Svetlogorsk', 
        'Zelenogradsk', 
        'Another address in Kaliningrad',
        'Office'
      ],
      locationStart: 'Офис',
      locationEnd: 'Офис',
      locationStartPrice: 0,
      locationEndPrice: 0,
      price: null,
      deposit: 0,
      total: 0,
      carError: false,
      nameError: false,
      middlenameError: false,
      lastnameError: false,
      emailError: false,
      phoneError: false,
      dateStartError: false,
      dateEndError: false,
      personDataError: false,
      termsDataError: false,
      isModalVisible: false,
      files: '',
      file: '',
      file2: ''
    };
  },
  validations: {
    nameClient: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(15)
    },
    middlenameClient: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(15)
    },
    lastnameClient: {
      required,
      minLength: minLength(2),
      maxLength: maxLength(15)
    },
    emailClient: {
      required,
      email
    },
    phoneClient: {
      required,
      minLength: minLength(5),
      maxLength: maxLength(20)
    }
  },
  created() {
    axios.get("https://amigorent.ru/api/v1/cars.json").then(response => {
    // axios.get("http://localhost:3000/api/v1/cars.json").then(response => {
      this.cars = response.data;
      const carsArr = []
      this.cars.forEach(function(car) {
        const carId = car.id
        const carName = car.car_name
        carsArr.push({'id': carId, 'car_name': carName, 'price_1': car.price_1, 'price_2': car.price_2, 'price_3': car.price_3, 'price_4': car.price_4, 'price_5': car.price_5, 'price_hour': car.price_hour,'deposit': car.deposit })
      });
      this.carsArr = carsArr
      this.carNames = carsArr.map(obj => obj.car_name)

      if (window.location.search) {
        let uri = window.location.href.split('?');
        if (uri.length == 2)
        {
          let vars = uri[1].split('&');
          let carId = {};
          let tmp = '';
          vars.forEach(function(v){
            tmp = v.split('=');
            if(tmp.length == 2)
            carId[tmp[0]] = tmp[1];
          });
          this.carId = carId.car_id
          let currentCar = carsArr.filter(obj => obj.id == this.carId)
          this.carNameWithId = currentCar[0].car_name
        }
      }
    });
  },
  methods: {
    notBeforeToday(date) {
      return date < today;
    },
    sendBooking () {
      
      if (this.carName === '') {
        this.errors.push(' - Выберите автомобиль')
        this.carError = true
      }
      if (this.nameClient === '') {
        this.errors.push(' - Заполните имя')
        this.nameError = true
      }
      if (this.middlenameClient === '') {
        this.errors.push(' - Заполните отчество, если нет, введите второй раз фамилию')
        this.nameError = true
      }
      if (this.lastnameClient === '') {
        this.errors.push(' - Заполните фамилию')
        this.lastnameError = true
      }
      if (this.emailClient === '' || !this.$v.emailClient.email) {
        this.errors.push(' - Заполните корректный Email')
        this.emailError = true
      }
      if (this.phoneClient === '' || !this.$v.phoneClient.minLength) {
        this.errors.push(' - Заполните корректный телефон')
        this.phoneError = true
      }
      if (this.dateStart === null) {
        this.errors.push(' - Выберите дату начала аренды')
        this.dateStartError = true
      }
      if (this.dateEnd === null) {
        this.errors.push(' - Выберите дату окончания аренды')
        this.dateEndError = true
      }
      if (this.personData === false) {
        this.errors.push(' - Подтверите согласие с обработкой персональных данных')
        this.personDataError = true
      }
      if (this.termsData === false) {
        this.errors.push(' - Подтверите ознакомление с условиями аренды')
        this.termsDataError = true
      }
      if (this.days === 'Минимум 2-е суток') {
        this.errors.push(' - Минимальный срок аренды 2-е суток')
        // this.personDataError = true
      }

      if (this.carError === false && this.nameError === false && this.middlenameError === false && this.lastnameError === false && this.emailError === false && this.phoneError === false && this.dateStartError === false && this.dateEndError === false && this.days != 'Минимум 2-е суток' && this.personDataError === false && this.termsDataError === false) {
        
        var self=this;
        // this.file = this.$refs.file.files[0];
        // this.file2 = this.$refs.file2.files[0];
        let formData = new FormData();

        
        // formData.append('booking[picture]', this.file);
        // if (this.file2 != '') {
        //   formData.append('booking[prava]', this.file2);
        // }
        

        formData.append('booking[start_date]', this.dateStart);
        formData.append('booking[end_date]', this.dateEnd);
        formData.append('booking[additional_hours]', this.additional_hours);
        formData.append('booking[location_start]', this.locationStart);
        formData.append('booking[location_end]', this.locationEnd);
        formData.append('booking[firstname]', this.nameClient);
        formData.append('booking[middlename]', this.middlenameClient);
        formData.append('booking[lastname]', this.lastnameClient);
        formData.append('booking[baby_chair]', this.babyChair);
        formData.append('booking[navigator]', this.navigator);
        formData.append('booking[phone]', this.phoneClient);
        formData.append('booking[email]', this.emailClient);
        formData.append('booking[car]', this.carName);
        formData.append('booking[days]', this.days);
        formData.append('booking[price]', this.price);
        formData.append('booking[total]', this.total);
        formData.append('booking[deposit]', this.deposit);

        axios.post('https://amigorent.ru/api/v1/booking.json'
        // axios.post('http://localhost:3000/api/v1/booking.json'
        ,
          formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
              }
        )
        .then(function (response) {
          self.dateStart = null
          self.dateEnd = null
          self.locationStart = 'Офис'
          self.locationEnd = 'Офис'
          self.nameClient = ''
          self.middlenameClient = ''
          self.lastnameClient = ''
          self.babyChair = false
          self.navigator = false
          self.phoneClient = ''
          self.emailClient = ''
          self.days = 0
          self.price = 0
          self.deposit = 0
          self.total = 0

          // self.showModal()
          window.location.href = '/success';
        })
        .catch(function (error) {
          console.log(error);
        });
      
      }
    },
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
    handleFilesUpload(){
      this.file = this.$refs.file.files[0];
      console.log(this.$refs.file.files[0])
      if (this.$refs.file2.files[0] != undefined) {
        this.file2 = this.$refs.file2.files[0];
      }

      console.log(this.$refs.file2.files[0])
    }
  },
  watch: {
    nameClient () {
      this.errors = []
      this.nameError = false
    },
    lastnameClient () {
      this.errors = []
      this.lastnameError = false
    },
    emailClient () {
      this.errors = []
      this.emailError = false
    },
    phoneClient () {
      this.errors = []
      this.phoneError = false
    },
    personData () {
      this.errors = []
      this.personDataError = false
    },
    termsData () {
      this.errors = []
      this.termsDataError = false
    },
    dateEnd () {
      let start_date = moment(this.dateStart, "DD-MM-YYYY H:mm")
      let end_date = moment(this.dateEnd, "DD-MM-YYYY H:mm")
      let hours = moment.duration(end_date.diff(start_date)).asHours()
      
      let start_date_days = moment(this.dateStart, "DD-MM-YYYY")
      let end_date_days = moment(this.dateEnd, "DD-MM-YYYY")
      this.additional_hours = 0
      if (hours > (moment.duration(end_date_days.diff(start_date_days)).asDays() * 24)) {
        this.hours = hours
          let additionalHours = (hours % 24)
          this.additional_hours = Math.trunc(additionalHours)
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays()
      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff
        }
        if (diff < 2) {
          this.days = 'Минимум 2-е суток'
        }
        if (diff >=2 && diff <= 3) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_1
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_1
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 3 && diff <= 7) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_2
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_2
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 7 && diff <= 14) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_3
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_3
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 14 && diff <= 30) {
         if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_4
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_4
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 30 ) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_5
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_5
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
      }
      this.locationStart = 'Офис'
      this.locationEnd = 'Офис'
      if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
        this.locationStartPrice = 0
      } else {
        this.locationStartPrice = 400
      }
      if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
        this.locationEndPrice = 0
      } else {
        this.locationEndPrice = 400
      }
      this.errors = []
      this.dateEndError = false
    },
    dateStart () {
      let start_date = moment(this.dateStart, "DD-MM-YYYY H:mm")
      let end_date = moment(this.dateEnd, "DD-MM-YYYY H:mm")
      
      let hours = moment.duration(end_date.diff(start_date)).asHours()
      
      let start_date_days = moment(this.dateStart, "DD-MM-YYYY")
      let end_date_days = moment(this.dateEnd, "DD-MM-YYYY")
      this.additional_hours = 0
      if (hours > (moment.duration(end_date_days.diff(start_date_days)).asDays() * 24)) {
          this.hours = hours
          let additionalHours = (hours % 24)
          this.additional_hours = Math.trunc(additionalHours)
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays()
      
      //let diff =  Math.floor(( Date.parse(this.dateEnd) - Date.parse(this.dateStart) ) / 86400000)

      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff
        }
        if (diff < 2) {
          this.days = 'Минимум 2-е суток'
        }
        if (diff >=2 && diff <= 3) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_1
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_1
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 3 && diff <= 7) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_2
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_2
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 7 && diff <= 14) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_3
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_3
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 14 && diff <= 30) {
         if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_4
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_4
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 30 ) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_5
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_5
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
      }
      this.locationStart = 'Офис'
      this.locationEnd = 'Офис'
      if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
        this.locationStartPrice = 0
      } else {
        this.locationStartPrice = 400
      }
      if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
        this.locationEndPrice = 0
      } else {
        this.locationEndPrice = 400
      }
      this.errors = []
      this.dateStartError = false
    },
    locationStart () {
      let start_date = moment(this.dateStart, "DD-MM-YYYY H:mm")
      switch (this.locationStart) {
        case 'Офис':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 0
          } else {
            this.locationStartPrice = 400
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Аэропорт':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 400
          } else {
            this.locationStartPrice = 700
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Зеленоградск':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 800
          } else {
            this.locationStartPrice = 1300
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Светлогорск':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 1000
          } else {
            this.locationStartPrice = 1500
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Другой адрес в Калининграде':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 200
          } else {
            this.locationStartPrice = 500
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Office':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 0
          } else {
            this.locationStartPrice = 400
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Airport':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 400
          } else {
            this.locationStartPrice = 700
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Zelenogradsk':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 800
          } else {
            this.locationStartPrice = 1300
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Svetlogorsk':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 1000
          } else {
            this.locationStartPrice = 1500
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Another address in Kaliningrad':
          if (moment(this.dateStart, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationStartPrice = 200
          } else {
            this.locationStartPrice = 500
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
      }
    },
    locationEnd () {
      switch (this.locationEnd) {
        case 'Офис':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 0
          } else {
            this.locationEndPrice = 400
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Аэропорт':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 400
          } else {
            this.locationEndPrice = 700
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Зеленоградск':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 800
          } else {
            this.locationEndPrice = 1300
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Светлогорск':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 1000
          } else {
            this.locationEndPrice = 1500
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Другой адрес в Калининграде':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 200
          } else {
            this.locationEndPrice = 500
          }
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Office':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 0
          } else {
            this.locationEndPrice = 400
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Airport':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 400
          } else {
            this.locationEndPrice = 700
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Zelenogradsk':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 800
          } else {
            this.locationEndPrice = 1300
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Svetlogorsk':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 1000
          } else {
            this.locationEndPrice = 1500
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
        case 'Another address in Kaliningrad':
          if (moment(this.dateEnd, "DD-MM-YYYY H:mm").isWorkingTime()) {
            this.locationEndPrice = 200
          } else {
            this.locationEndPrice = 500
          }

          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
          break;
      }
    },
    carName () {
      let obj = this.carsArr.find(o => o.car_name === this.carName);

      this.price_1 = obj.price_1
      this.price_2 = obj.price_2
      this.price_3 = obj.price_3
      this.price_4 = obj.price_4
      this.price_5 = obj.price_5
      this.price_hour = obj.price_hour
      this.deposit = obj.deposit

      this.errors = []
      this.carError = false
    },
    carNameWithId () {
      let obj = this.carsArr.find(o => o.car_name === this.carNameWithId);
      this.carName = this.carNameWithId

      this.price_1 = obj.price_1
      this.price_2 = obj.price_2
      this.price_3 = obj.price_3
      this.price_4 = obj.price_4
      this.price_5 = obj.price_5
      this.deposit = obj.deposit
    },
    babyChair () {
      if (this.babyChair === true) {
        this.babyChairPrice = 500
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      } else {
        this.babyChairPrice = 0
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      }
    },
    navigator () {
      if (this.navigator === true) {
        this.navigatorPrice = 500
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      } else {
        this.navigatorPrice = 0
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      }
    }
  },
  computed: {
        
  },
  components: {
      flatPickr,
      modal,
      TheMask
  }
};
</script>

<style>
  li.errors {
    color: tomato;
    font-weight: bold;
    list-style-type: none;
    margin-top: 5px;
  }
  .error-input {
    background-color: #fce4e4;
    border: 1px solid #cc0033;
    outline: none;
  }
</style>
