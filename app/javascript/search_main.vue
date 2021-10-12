<template>
  <div id="search_main">
    <loading
      :active.sync="isLoading"
      :is-full-page="true"
      color="#1976d2"
    ></loading>
    <div class="block2">
      <div class="wrapper">
        <div class="zagol">Подобрать и заказать автомобиль</div>
        <form>
            <div class="obol">
              <flat-pickr v-model="start_date" placeholder="Дата начала аренды" :config="configStart"></flat-pickr>
                <!-- <input type="text" value="" placeholder="Дата начала аренды" name="" /> -->
                <select v-model="start_time">
                  <option>08:00</option>
                  <option>09:00</option>
                  <option>10:00</option>
                  <option>11:00</option>
                  <option>12:00</option>
                  <option>13:00</option>
                  <option>14:00</option>
                  <option>15:00</option>
                  <option>16:00</option>
                  <option>17:00</option>
                  <option>18:00</option>
                  <option>19:00</option>
                  <option>20:00</option>
                  <option>21:00</option>
                  <option>22:00</option>
                  <option>23:00</option>
                  <option>00:00</option>
                  <option>01:00</option>
                  <option>02:00</option>
                  <option>03:00</option>
                  <option>04:00</option>
                  <option>05:00</option>
                  <option>06:00</option>
                  <option>07:00</option>
                </select>
                <div class="clear"></div>
            </div>
            <div class="obol">
                <flat-pickr v-model="end_date" placeholder="Дата конца аренды" :config="configEnd"></flat-pickr>
                <!-- <input type="text" value="" placeholder="Дата конца аренды" name="" /> -->
                <select v-model="end_time">
                  <option>08:00</option>
                  <option>09:00</option>
                  <option>10:00</option>
                  <option>11:00</option>
                  <option>12:00</option>
                  <option>13:00</option>
                  <option>14:00</option>
                  <option>15:00</option>
                  <option>16:00</option>
                  <option>17:00</option>
                  <option>18:00</option>
                  <option>19:00</option>
                  <option>20:00</option>
                  <option>21:00</option>
                  <option>22:00</option>
                  <option>23:00</option>
                  <option>00:00</option>
                  <option>01:00</option>
                  <option>02:00</option>
                  <option>03:00</option>
                  <option>04:00</option>
                  <option>05:00</option>
                  <option>06:00</option>
                  <option>07:00</option>
                </select>
                <div class="clear"></div>
            </div>
            <button @click.prevent="goToCars()">Поиск</button>
            <div class="clear"></div>
        </form>
        <div class="clear"></div>
      </div>
    </div>
  </div>
</template>

<script>
import flatPickr from 'vue-flatpickr-component';
import 'flatpickr/dist/flatpickr.css';
  import { Russian } from "flatpickr/dist/l10n/ru"
import moment from 'moment'
  import 'moment/locale/ru'
flatpickr.localize(Russian);
export default {
  data: function () {
    return {
      start_date: null,
      end_date: null,
      configStart: {
        altFormat: 'j M Y',
        altInput: true,
        dateFormat: 'd-m-Y',
        minDate: "today",
      },
      start_time: "11:00",
      end_time: "11:00",
      configEnd: {
        altFormat: 'j M Y',
        altInput: true,
        dateFormat: 'd-m-Y',
        minDate: "today",
      },
      isLoading: false
    };
  },
  methods: {
    goToCars () {
      if (this.start_date && this.end_date && this.start_time && this.end_time) {
        if (moment(this.start_date, "DD-MM-YYYY").isSameOrBefore(moment(this.end_date, "DD-MM-YYYY"))) {
          window.location.replace(`/cars?start_date=${this.start_date}&start_time=${this.start_time}&end_date=${this.end_date}&end_time=${this.end_time}&city=Калининград`)
        } else {
          this.$swal({
            type: "warning",
            title: "Ошибка!",
            text: "Дата начала раньше окончания аренды"
          });
        }
      } else {
        this.$swal({
          type: "warning",
          title: "Ошибка!",
          text: "Пожалуйста заполните даты и время аренды"
        });
      }
    },
  },
  components: {
    flatPickr
  }
};
</script>

<style scoped>

</style>
