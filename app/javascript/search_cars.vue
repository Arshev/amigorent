<template>
  <div id="search_main">
    <form v-if="locale == 'en'">
      <div class="obol">
        <flat-pickr
          v-model="start_date"
          placeholder="Lease start date"
          :config="configStart"
        ></flat-pickr>
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
        <flat-pickr
          v-model="end_date"
          placeholder="Lease end date"
          :config="configEnd"
        ></flat-pickr>
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
      <button @click.prevent="goToCars()">Search</button>
      <div class="filtry"><a @click.prevent="goToAllCars()">Clear</a></div>
      <div class="clear"></div>
    </form>
    <form v-else>
      <div class="obol">
        <flat-pickr
          v-model="start_date"
          placeholder="Дата начала аренды"
          :config="configStart"
        ></flat-pickr>
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
        <flat-pickr
          v-model="end_date"
          placeholder="Дата конца аренды"
          :config="configEnd"
        ></flat-pickr>
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
      <div class="filtry"><a @click.prevent="goToAllCars()">Очистить</a></div>
      <div class="clear"></div>
    </form>
    <div class="clear"></div>
  </div>
</template>

<script>
import flatPickr from "vue-flatpickr-component";
// import "flatpickr/dist/flatpickr.css";
import { Russian } from "flatpickr/dist/l10n/ru";
import moment from "moment";
import "moment/locale/ru";
flatpickr.localize(Russian);
export default {
  props: {
    city: {
      type: String,
    },
    locale: {
      type: String,
    },
  },
  data: function () {
    return {
      start_date: null,
      end_date: null,
      configStart: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: "today",
      },
      start_time: "11:00",
      end_time: "11:00",
      configEnd: {
        altFormat: "j M Y",
        altInput: true,
        dateFormat: "d-m-Y",
        minDate: "today",
      },
      isLoading: false,
    };
  },
  created() {
    if (new URL(location.href).searchParams.get("start_date")) {
      this.start_date = new URL(location.href).searchParams.get("start_date");
    }
    if (new URL(location.href).searchParams.get("end_date")) {
      this.end_date = new URL(location.href).searchParams.get("end_date");
    }
    if (new URL(location.href).searchParams.get("start_time")) {
      this.start_time = new URL(location.href).searchParams.get("start_time");
    }
    if (new URL(location.href).searchParams.get("end_time")) {
      this.end_time = new URL(location.href).searchParams.get("end_time");
    }
  },
  watch: {
    start_date() {
      if (this.start_date) {
        this.configEnd.minDate = moment(this.start_date, "DD-MM-YYYY").toDate();
      }
    },
  },
  methods: {
    goToCars() {
      if (
        this.start_date &&
        this.end_date &&
        this.start_time &&
        this.end_time
      ) {
        if (
          moment(this.start_date, "DD-MM-YYYY").isSameOrBefore(
            moment(this.end_date, "DD-MM-YYYY")
          )
        ) {
          if (window["ym"]) {
            console.log("search_cars_from_cars_metrika", 48045371);
            window["ym"](
              48045371,
              "reachGoal",
              "search_cars_from_cars",
              {
                start_date: this.start_date,
                end_date: this.end_date,
                car_id: this.set_car.id,
              },
              () => {
                console.log("search_cars_from_cars_metrika success");
              },
              (err) => {
                console.log("search_cars_from_cars_metrika error", err);
              }
            );
          } else {
            console.log("search_cars_from_cars_metrika not found");
          }
          if (this.locale && this.locale == "en") {
            window.location.replace(
              `/en/cars?start_date=${this.start_date}&start_time=${this.start_time}&end_date=${this.end_date}&end_time=${this.end_time}&city=${this.city}`
            );
          } else {
            window.location.replace(
              `/cars?start_date=${this.start_date}&start_time=${this.start_time}&end_date=${this.end_date}&end_time=${this.end_time}&city=${this.city}`
            );
          }
        } else {
          this.$swal({
            type: "warning",
            title: "Ошибка!",
            text: "Дата начала раньше окончания аренды",
          });
        }
      } else {
        this.$swal({
          type: "warning",
          title: "Ошибка!",
          text: "Пожалуйста заполните даты и время аренды",
        });
      }
    },
    goToAllCars() {
      if (this.locale && this.locale == "en") {
        window.location.replace(`/en/cars?city=${this.city}`);
      } else {
        window.location.replace(`/cars?city=${this.city}`);
      }
    },
  },
  components: {
    flatPickr,
  },
};
</script>

<style scoped></style>
