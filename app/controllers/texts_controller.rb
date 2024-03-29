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
      flash[:notice] = 'Сохранено'
    else
      flash[:alert] = 'Что то не так!'
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def text_params
    params
      .require(:text)
      .permit(
        :main_up_text,
        :main_h1_text,
        :main_quick_booking_text,
        :main_substances_text,
        :main_car_list_text,
        :main_services_text,
        :main_mission_text,
        :main_edge_text,
        :footer_text,
        :prices_text,
        :prices_bottom_text,
        :contacts_text,
        :bookings_bottom_text,
        :reviews_text,
        :terms_text,
        :faqs_text,
        :about_text,
        :main_description,
        :main_title,
        :bookings_title,
        :bookings_description,
        :cars_title,
        :cars_description,
        :car_title,
        :car_description,
        :prices_title,
        :prices_description,
        :contacts_title,
        :contacts_description,
        :reviews_title,
        :reviews_description,
        :terms_title,
        :terms_description,
        :faqs_title,
        :faqs_description,
        :abouts_title,
        :abouts_description,
        :services_title,
        :services_description,
        :deliveries_title,
        :deliveries_description,
        :delivery_title,
        :delivery_description,
        :articles_title,
        :articles_description,
        :articles_h1,
        :dop_table_worktime,
        :dop_table_endtime,
        :dop_table_city_price_worktime,
        :dop_table_city_price_endtime,
        :dop_table_aero_price_worktime,
        :dop_table_aero_price_endtime,
        :dop_table_svetlogorsk_price_worktime,
        :dop_table_svetlogorsk_price_endtime,
        :dop_table_zelenogradsk_price_worktime,
        :dop_table_zelenogradsk_price_endtime,
        :dop_table_kosa_price_worktime,
        :dop_table_kosa_price_endtime,
        :dop_table_kreslo_dayprice,
        :dop_table_kreslo_allprice,
        :dop_table_navigator_dayprice,
        :dop_table_downtext,
        :conditions,
        :success,
        :aeroport_h1,
        :aeroport_title,
        :aeroport_description,
        :aeroport_price,
        :aeroport_price_unwork,
        :aeroport_avto,
        :zelenogradsk_h1,
        :zelenogradsk_title,
        :zelenogradsk_description,
        :zelenogradsk_price,
        :zelenogradsk_price_unwork,
        :zelenogradsk_avto,
        :svetlogorsk_h1,
        :svetlogorsk_title,
        :svetlogorsk_description,
        :svetlogorsk_price,
        :svetlogorsk_price_unwork,
        :svetlogorsk_avto,
        :yantarnyi_h1,
        :yantarnyi_title,
        :yantarnyi_description,
        :yantarnyi_price,
        :yantarnyi_price_unwork,
        :yantarnyi_avto,
        :baltyisk_h1,
        :baltyisk_title,
        :baltyisk_description,
        :baltyisk_price,
        :baltyisk_price_unwork,
        :baltyisk_avto,
        :pionerskyi_h1,
        :pionerskyi_title,
        :pionerskyi_description,
        :pionerskyi_price,
        :pionerskyi_price_unwork,
        :pionerskyi_avto,
        :chernyahovsk_h1,
        :chernyahovsk_title,
        :chernyahovsk_description,
        :chernyahovsk_price,
        :chernyahovsk_price_unwork,
        :chernyahovsk_avto,
        :aeroport_text,
        :zelenogradsk_text,
        :svetlogorsk_text,
        :yantarnyi_text,
        :baltyisk_text,
        :pionerskyi_text,
        :chernyahovsk_text,
        :s_voditelem_text,
        :s_voditelem_title,
        :s_voditelem_description,
        :car_sharing_text,
        :car_sharing_title,
        :car_sharing_description,
        :casko_text,
        :casko_title,
        :casko_description,
        :corporate_text,
        :corporate_title,
        :corporate_description,
        :sales_text,
        :sales_title,
        :sales_description,
        :payment_text,
        :payment_title,
        :payment_description,
        :outsours_text,
        :outsours_title,
        :outsours_description,
        :term_common,
        :term_docs,
        :term_gringo,
        :term_companies,
        :term_clients,
        :term_no_franchise,
        :term_other,
        :term_abroad,
        :term_bottom,
        :full_insurance_title,
        :full_insurance_description,
        :full_insurance_h1,
        :full_insurance_text,
        :car_sharing_h1,
        :casko_h1,
        :corporate_h1,
        :sales_h1,
        :payment_h1,
        :outsours_h1,
        :s_voditelem_h1,
        :main_up_text_en,
        :main_h1_text_en,
        :main_quick_booking_text_en,
        :main_substances_text_en,
        :main_car_list_text_en,
        :main_services_text_en,
        :main_mission_text_en,
        :main_edge_text_en,
        :footer_text_en,
        :prices_text_en,
        :prices_bottom_text_en,
        :contacts_text_en,
        :bookings_bottom_text_en,
        :reviews_text_en,
        :terms_text_en,
        :faqs_text_en,
        :about_text_en,
        :main_description_en,
        :main_title_en,
        :bookings_title_en,
        :bookings_description_en,
        :cars_title_en,
        :cars_description_en,
        :car_title_en,
        :car_description_en,
        :prices_title_en,
        :prices_description_en,
        :contacts_title_en,
        :contacts_description_en,
        :reviews_title_en,
        :reviews_description_en,
        :terms_title_en,
        :terms_description_en,
        :faqs_title_en,
        :faqs_description_en,
        :abouts_title_en,
        :abouts_description_en,
        :services_title_en,
        :services_description_en,
        :deliveries_title_en,
        :deliveries_description_en,
        :delivery_title_en,
        :delivery_description_en,
        :articles_title_en,
        :articles_description_en,
        :articles_h1_en,
        :dop_table_downtext_en,
        :conditions_en,
        :success_en,
        :aeroport_h1_en,
        :aeroport_title_en,
        :aeroport_description_en,
        :aeroport_avto_en,
        :zelenogradsk_h1_en,
        :zelenogradsk_title_en,
        :zelenogradsk_description_en,
        :zelenogradsk_avto_en,
        :svetlogorsk_h1_en,
        :svetlogorsk_title_en,
        :svetlogorsk_description_en,
        :svetlogorsk_avto_en,
        :yantarnyi_h1_en,
        :yantarnyi_title_en,
        :yantarnyi_description_en,
        :yantarnyi_avto_en,
        :baltyisk_h1_en,
        :baltyisk_title_en,
        :baltyisk_description_en,
        :baltyisk_avto_en,
        :pionerskyi_h1_en,
        :pionerskyi_title_en,
        :pionerskyi_description_en,
        :pionerskyi_avto_en,
        :chernyahovsk_h1_en,
        :chernyahovsk_title_en,
        :chernyahovsk_description_en,
        :chernyahovsk_avto_en,
        :aeroport_text_en,
        :zelenogradsk_text_en,
        :svetlogorsk_text_en,
        :yantarnyi_text_en,
        :baltyisk_text_en,
        :pionerskyi_text_en,
        :chernyahovsk_text_en,
        :s_voditelem_text_en,
        :s_voditelem_title_en,
        :s_voditelem_description_en,
        :car_sharing_text_en,
        :car_sharing_title_en,
        :car_sharing_description_en,
        :casko_text_en,
        :casko_title_en,
        :casko_description_en,
        :corporate_text_en,
        :corporate_title_en,
        :corporate_description_en,
        :sales_text_en,
        :sales_title_en,
        :sales_description_en,
        :payment_text_en,
        :payment_title_en,
        :payment_description_en,
        :payment_h1_en,
        :partners_text_en,
        :partners_title_en,
        :partners_description_en,
        :partners_h1_en,
        :partners_text,
        :partners_title,
        :partners_description,
        :partners_h1,
        :franchise_text_en,
        :franchise_title_en,
        :franchise_description_en,
        :franchise_h1_en,
        :franchise_text,
        :franchise_title,
        :franchise_description,
        :franchise_h1,
        :outsours_text_en,
        :outsours_title_en,
        :outsours_description_en,
        :term_common_en,
        :term_docs_en,
        :term_gringo_en,
        :term_companies_en,
        :term_clients_en,
        :term_no_franchise_en,
        :term_other_en,
        :term_abroad_en,
        :term_bottom_en,
        :full_insurance_title_en,
        :full_insurance_description_en,
        :full_insurance_h1_en,
        :full_insurance_text_en,
        :car_sharing_h1_en,
        :casko_h1_en,
        :corporate_h1_en,
        :sales_h1_en,
        :outsours_h1_en,
        :s_voditelem_h1_en,
        :main_text,
        :main_text_en,
        :cars_economy_title,
        :cars_economy_description,
        :cars_economy_h1,
        :cars_economy_text,
        :cars_economy_title_en,
        :cars_economy_description_en,
        :cars_economy_h1_en,
        :cars_economy_text_en,
        :cars_middle_title,
        :cars_middle_description,
        :cars_middle_h1,
        :cars_middle_text,
        :cars_middle_title_en,
        :cars_middle_description_en,
        :cars_middle_h1_en,
        :cars_middle_text_en,
        :cars_crossovers_title,
        :cars_crossovers_description,
        :cars_crossovers_h1,
        :cars_crossovers_text,
        :cars_crossovers_title_en,
        :cars_crossovers_description_en,
        :cars_crossovers_h1_en,
        :cars_crossovers_text_en,
        :cars_minivans_title,
        :cars_minivans_description,
        :cars_minivans_h1,
        :cars_minivans_text,
        :cars_minivans_title_en,
        :cars_minivans_description_en,
        :cars_minivans_h1_en,
        :cars_minivans_text_en,
        :cars_business_title,
        :cars_business_description,
        :cars_business_h1,
        :cars_business_text,
        :cars_business_title_en,
        :cars_business_description_en,
        :cars_business_h1_en,
        :cars_business_text_en,
        :cars_commercial_title,
        :cars_commercial_description,
        :cars_commercial_h1,
        :cars_commercial_text,
        :cars_commercial_title_en,
        :cars_commercial_description_en,
        :cars_commercial_h1_en,
        :cars_commercial_text_en,
        :bookings_h1,
        :bookings_h1_en,
        :contacts_phones,
        :contacts_phones_en,
        :contacts_email,
        :top_cars_title,
        :top_cars_title_en,
        :top_cars,
        :top_cars_en,
        :main_question_title_1,
        :main_question_title_2,
        :main_question_title_3,
        :main_question_title_1_en,
        :main_question_title_2_en,
        :main_question_title_3_en,
        :main_question_1,
        :main_question_2,
        :main_question_3,
        :main_question_1_en,
        :main_question_2_en,
        :main_question_3_en,
        :cars_cabrio_title,
        :cars_cabrio_description,
        :cars_cabrio_h1,
        :cars_cabrio_text,
        :cars_cabrio_title_en,
        :cars_cabrio_description_en,
        :cars_cabrio_h1_en,
        :cars_cabrio_text_en,
      )
  end
end
