FactoryBot.define do
  factory :user do
    email                {"test@com"}
    encrypted_password   {"qwe123"}
    nickname             {"武蔵"}
    family_name          {"山本"}
    last_name            {"武蔵"}
    family_name_kana     {"ヤマモト"}
    last_name_kana       {"ムサシ"}
    birthday             {"1990.04.22"}
  end
end