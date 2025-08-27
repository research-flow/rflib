# standardize_and_categorize_responses <- function(input_data, question, num_responses, api_key = Sys.getenv("OPENAPI_KEY_MR")) {
#     # A system prompt, ami tájékoztatja a modellt a feladat természetéről
#     system_prompt <- str_c("Te egy csak magyarul beszélő kutatási segéd vagy, aki egy orvosok által kitöltött kérdőívet elemez, és a szöveges válaszok egységesítése és kategorizálása a feladatod.
#                          Kérlek, ügyelj arra, hogy minden válaszhoz tartozzon pontosan egy kimeneti érték, a válaszok pontos száma megegyezzen az eredetivel.")

#     # Alapértelmezett üzenetek a válaszok kezelésére
#     prompt_intro <- "A válaszok az alábbi kérdésre vonatkoznak: "

#     # Kategorizálás: minimum 11 kategória létrehozása
#     prompt_categorise <- paste0(
#         "Egy ", num_responses, " hosszú kimeneti vektorra van szükség. A tisztítandó válaszok az alábbiak: ",
#         paste0(str_c(input_data), collapse = "\n"), "Minden válasz egy új sorban található (\n)-el jelölve.",
#         "Kategorizáld a válaszokat és mindegyik válaszhoz adj meg egy kategóriát, amellyel könnyen értelmezhetővé teszed egy ügyfélnek. Egységesítsd a válaszokat, hogy minél egységesebb kategóriák kerüljenek kimutatásra.
#     Pontosan 10 különböző kategóriát hozz létre, és kösd őket a megadott válaszokhoz!",
#         "Ahol üres volt a válasz, vagy 0 vagy x, ott 'NA' értéket adj vissza!,
#     Add vissza a válaszban, hogy melyik eredeti válaszhoz párosítottad!"
#     )

#     # Egységesítés promptja: A válaszok egységesítése, figyelmen kívül hagyva az apró eltéréseket
#     prompt_standardize <- stringr::str_c(
#         "Egy ", num_responses, " hosszú kimeneti vektorra van szükség. A tisztítandó válaszok az alábbiak: ",
#         paste0(input_data, collapse = "\n"), " Minden válasz egy új sorban található (\n)-el jelölve.
#     A válaszokat egységesíteni kell úgy, hogy a tartalom ne nagyon változzon, de a különböző írásmódbeli eltéréseket javítsd, akár nevek akár más helyesírását is!
#     Egységesítsd a válaszokat, a tartalmán ne változtass, csak az írásmódokat, úgy hogy minél több hasonló válasz legyen, kisebb írásbeli eltéréseket nyugodtan kijavíthatsz, de a tartalmán ne változtass! CSAK egy karaktervektort adj vissza! Minden bemeneti válaszhoz adj vissza legalább és maximum egy kimeneti értéket, ettől nem térhetsz el! Ahol üres volt a válasz, vagy ehhez hasonló, tehát 0, vagy x, ott NA értéket adj vissza!
#     Kisebb eltéréseket korrigálj, de a válaszok tartalma maradjon meg.
#     Egy karaktervektort adj vissza, amely minden válaszhoz tartozik, és ne változtass meg semmit a válaszok száma tekintetében!
#     Ahol üres volt a válasz, vagy 0 vagy x, ott 'NA' értéket adj vissza!
#     Add vissza a válaszban, hogy melyik eredeti válaszhoz párosítottad!"
#     )


#     type_declare_prompt <-
#         "Döntsd el, hogy az alábbi kérdés mire vonatkozik: témakörök felsorolására (categorise), vagy konkrét személyek, vagy diagnózisok vagy terápiás megközelítések felsorolására (clean)!"




#     # A válaszokat kategóriákat tartalmazó objektummá alakítjuk
#     category_type <-
#         type_object(
#             question_type =
#                 type_enum(
#                     values = c("clean", "categorise")
#                 )
#         )
#     category_answers <-
#         type_array(
#             items = type_object(
#                 original_answer = type_string("Eredeti válasz a bemeneti promptból"),
#                 cleaned_and_categorised_answer = type_string("Tisztított vagy kategorizált kimeneti válasz")
#             )
#         )


#     full_prompt_type <- str_c(
#         type_declare_prompt,
#         " ", question
#     )

#     chat <- ellmer::chat_openai(
#         model = "gpt-4o", api_key = api_key,
#         system_prompt = system_prompt
#     )

#     type_from_chatgpt <- chat$extract_data(full_prompt_type, type = category_type)

#     message(question, type_from_chatgpt)

#     # A ChatGPT hívás, ahol az OpenAI API-t használjuk
#     # A válaszok kinyerése a végső prompt alapján


#     # A végső prompt, amely az összes lépést összegzi
#     final_prompt <-
#         if (type_from_chatgpt == "clean") {
#             str_c(
#                 prompt_intro, question, " ",
#                 prompt_standardize
#             )
#         } else if (type_from_chatgpt == "categorise") {
#             str_c(
#                 prompt_intro, question, " ",
#                 prompt_categorise
#             )
#         }

#     data <- chat$extract_data(final_prompt, type = category_answers)


#     # Visszaadjuk a kategorizált válaszokat
#     return(data)
# }


# custom_function <- function(provider, req) {
#     req |>
#         httr2::req_timeout(900) |>
#         httr2::req_perform() |>
#         httr2::resp_body_json()
# }
# unlockBinding("chat_perform_value", asNamespace("ellmer"))
# assign("chat_perform_value", custom_function, envir = asNamespace("ellmer"))
# lockBinding("chat_perform_value", asNamespace("ellmer"))
