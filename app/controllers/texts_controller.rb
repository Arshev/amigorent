class TextsController < ApplicationController
  def text_main
    @main_up_text = Text.first.main_up_text
    @main_h1_text = Text.first.main_h1_text
    @main_quick_booking_text = Text.first.main_quick_booking_text
    @main_substances_text = Text.first.main_substances_text
    @main_car_list_text = Text.first.main_car_list_text
    @main_services_text = Text.first.main_services_text
    @main_mission_text = Text.first.main_mission_text
    @main_edge_text = Text.first.main_edge_text
    @footer_text = Text.first.footer_text
    @prices_text = Text.first.prices_text
    @contacts_text = Text.first.contacts_text
    @bookings_bottom_text = Text.first.bookings_bottom_text
    @reviews_text = Text.first.reviews_text
    @terms_text = Text.first.terms_text
    @faqs_text = Text.first.faqs_text
    @about_text = Text.first.about_text
    @conditions_text = Text.first.conditions
    @success_text = Text.first.success
  end

  def update
    if Text.update(text_params)
      flash[:notice] = "Сохранено"
    else
      flash[:alert] = "Что то не так!"
    end
    redirect_back(fallback_location: request.referer)
  end
private
  def text_params
    params.require(:text).permit(:main_up_text, :main_h1_text, 
      :main_quick_booking_text, :main_substances_text, 
      :main_car_list_text, :main_services_text, 
      :main_mission_text, :main_edge_text, 
      :footer_text, :prices_text, :prices_bottom_text, 
      :contacts_text, :bookings_bottom_text, 
      :reviews_text, :terms_text, :faqs_text, 
      :about_text, :main_description, :main_title, 
      :bookings_title, :bookings_description,
      :cars_title, :cars_description, :car_title, :car_description, :prices_title, 
      :prices_description, :contacts_title, :contacts_description,
      :reviews_title, :reviews_description,
      :terms_title, :terms_description, :faqs_title, :faqs_description,
      :abouts_title, :abouts_description, :services_title, :services_description, :deliveries_title, 
      :deliveries_description, :delivery_title, :delivery_description, :articles_title, 
      :articles_description, :dop_table_worktime,
      :dop_table_endtime, :dop_table_city_price_worktime, :dop_table_city_price_endtime,
      :dop_table_aero_price_worktime, :dop_table_aero_price_endtime,
      :dop_table_svetlogorsk_price_worktime, :dop_table_svetlogorsk_price_endtime,
      :dop_table_zelenogradsk_price_worktime, :dop_table_zelenogradsk_price_endtime,
      :dop_table_kosa_price_worktime, :dop_table_kosa_price_endtime,
      :dop_table_kreslo_dayprice, :dop_table_kreslo_allprice,
      :dop_table_navigator_dayprice, :dop_table_downtext, :conditions, :success,
      :aeroport_h1, :aeroport_title, :aeroport_description, :aeroport_price, 
      :aeroport_price_unwork, :aeroport_avto, :zelenogradsk_h1, :zelenogradsk_title, 
      :zelenogradsk_description, :zelenogradsk_price, :zelenogradsk_price_unwork, :zelenogradsk_avto, 
      :svetlogorsk_h1, :svetlogorsk_title, :svetlogorsk_description, :svetlogorsk_price, 
      :svetlogorsk_price_unwork, :svetlogorsk_avto, :yantarnyi_h1, :yantarnyi_title, 
      :yantarnyi_description, :yantarnyi_price, :yantarnyi_price_unwork, :yantarnyi_avto, 
      :baltyisk_h1, :baltyisk_title, :baltyisk_description, :baltyisk_price, :baltyisk_price_unwork, 
      :baltyisk_avto, :pionerskyi_h1, :pionerskyi_title, :pionerskyi_description, :pionerskyi_price, 
      :pionerskyi_price_unwork, :pionerskyi_avto, :chernyahovsk_h1, :chernyahovsk_title, 
      :chernyahovsk_description, :chernyahovsk_price, :chernyahovsk_price_unwork, :chernyahovsk_avto,
      :aeroport_text, :zelenogradsk_text, :svetlogorsk_text, :yantarnyi_text, :baltyisk_text, :pionerskyi_text, 
      :chernyahovsk_text, :s_voditelem_text, :s_voditelem_title, :s_voditelem_description, 
      :car_sharing_text, :car_sharing_title, :car_sharing_description, :casko_text, 
      :casko_title, :casko_description, :corporate_text, :corporate_title, :corporate_description, 
      :sales_text, :sales_title, :sales_description, :payment_text, :payment_title, 
      :payment_description, :outsours_text, :outsours_title, :outsours_description
    )
  end
end
