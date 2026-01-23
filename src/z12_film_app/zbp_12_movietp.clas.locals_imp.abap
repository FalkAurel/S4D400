CLASS lhc_ratings DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DeterminationUsername FOR DETERMINE ON SAVE
      IMPORTING keys FOR Ratings~DeterminationUsername.
    METHODS DeterminationRatingDate FOR DETERMINE ON SAVE
      IMPORTING keys FOR Ratings~DeterminationRatingDate.

ENDCLASS.

CLASS lhc_ratings IMPLEMENTATION.

  METHOD DeterminationUsername.
    DATA ratings TYPE TABLE FOR UPDATE ZR_12_RatingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #(
      %tky = key-%tky
      username = sy-uname
      ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_12_MovieTP IN LOCAL MODE
    ENTITY Ratings
    UPDATE FIELDS ( UserName )
    WITH ratings.
  ENDMETHOD.

  METHOD DeterminationRatingDate.
  DATA ratings TYPE TABLE FOR UPDATE ZR_12_RatingTP.

    LOOP AT keys INTO DATA(key).
      APPEND VALUE #(
      %tky = key-%tky
      ratingdate = sy-datlo
      ) TO ratings.
    ENDLOOP.

    MODIFY ENTITIES OF ZR_12_MovieTP IN LOCAL MODE
    ENTITY Ratings
    UPDATE FIELDS ( RatingDate )
    WITH ratings.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Movies DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movies RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Movies RESULT result.
    METHODS ValidateGenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR Movies~ValidateGenre.

ENDCLASS.

CLASS lhc_Movies IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.

    DATA genres TYPE TABLE FOR READ RESULT ZR_12_MovieTP.

    READ ENTITIES OF ZR_12_MovieTP IN LOCAL MODE
      ENTITY Movies
      FIELDS ( MovieUuid )
      WITH CORRESPONDING #( keys )
      RESULT genres.

    LOOP AT genres INTO DATA(genre).
      SELECT SINGLE FROM zabap_movie_a
        FIELDS @abap_true WHERE genre = @genre-Genre
        INTO @DATA(exists).

      IF exists = abap_false.
        APPEND VALUE #( %tky = genre-%tky ) TO failed-movies.

        DATA(message) = NEW zcm_abap_movie(
         textid = zcm_abap_movie=>no_genre_found
         genre = genre-kur
         severity = if_abap_behv_message=>severity-error
         ).

        APPEND VALUE #( %tky = genre-%tky
                        %msg = message
                        %element-movieuuid = if_abap_behv=>mk-on ) TO reported-movies.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
