package com.ebt.common;

/**
 * Интерфейс объектов видео.
 *
 * @author Pavel Vasilenko
 */
public interface Video {

    String getSource();

    String getId();

    String getTitle();

    String getUrl();

    Double getRating();

    VideoCategory getCategory();

}
