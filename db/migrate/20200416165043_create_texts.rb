class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.text :main_up_text, default: 'Дорогой друг, добро пожаловать в автопрокат <b>Амиго!</b>'
      t.text :main_h1_text, default: "empty"
      t.text :main_quick_booking_text, default: "empty"
      t.text :main_substances_text, default: "empty"
      t.text :main_car_list_text, default: "empty"
      t.text :main_services_text, default: "empty"
      t.text :main_mission_text, default: "empty"
      t.text :main_edge_text, default: "empty"
      t.text :footer_text, default: "empty"
      t.text :prices_text, default: "empty"
      t.text :prices_bottom_text, default: "empty"
      t.text :contacts_text, default: "empty"
      t.text :bookings_bottom_text, default: "empty"
      t.text :reviews_text, default: "empty"
      t.text :terms_text, default: "empty"
      t.text :faqs_text, default: "empty"
      t.text :about_text, default: "empty"
      t.text :home_title, default: "empty"
      t.text :home_description, default: "empty"
      t.text :cars_title, default: "empty"
      t.text :cars_description, default: "empty"
      t.text :prices_title, default: "empty"
      t.text :prices_description, default: "empty"
      t.text :contacts_title, default: "empty"
      t.text :contacts_description, default: "empty"
      t.text :bookings_title, default: "empty"
      t.text :bookings_description, default: "empty"
      t.text :reviews_title, default: "empty"
      t.text :reviews_description, default: "empty"
      t.text :terms_title, default: "empty"
      t.text :terms_description, default: "empty"
      t.text :faqs_title, default: "empty"
      t.text :faqs_description, default: "empty"
      t.text :abouts_title, default: "empty"
      t.text :abouts_description, default: "empty"
      t.text :dop_table_worktime, default: "empty"
      t.text :dop_table_endtime, default: "empty"
      t.text :dop_table_city_price_worktime, default: "empty"
      t.text :dop_table_city_price_endtime, default: "empty"
      t.text :dop_table_aero_price_worktime, default: "empty"
      t.text :dop_table_aero_price_endtime, default: "empty"
      t.text :dop_table_svetlogorsk_price_worktime, default: "empty"
      t.text :dop_table_svetlogorsk_price_endtime, default: "empty"
      t.text :dop_table_zelenogradsk_price_worktime, default: "empty"
      t.text :dop_table_zelenogradsk_price_endtime, default: "empty"
      t.text :dop_table_kosa_price_worktime, default: "empty"
      t.text :dop_table_kosa_price_endtime, default: "empty"
      t.text :dop_table_kreslo_dayprice, default: "empty"
      t.text :dop_table_kreslo_allprice, default: "empty"
      t.text :dop_table_navigator_dayprice, default: "empty"
      t.text :dop_table_downtext, default: "empty"

      t.timestamps
    end
  end
end