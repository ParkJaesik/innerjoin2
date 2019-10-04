package com.best.innerjoin.album.model.exception;

public class AlbumException extends RuntimeException { // Exception은 부모 클래스이므로 checked Exception -> 또 예외처리를 해주어야함 , RuntimeException은 하위 모든 클래스가 unchecked Exception임

	public AlbumException(String msg) {
		super(msg);
	}
}
