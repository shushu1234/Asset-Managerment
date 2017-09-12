package com.shushu.utils;

import java.util.Random;

public class RandomUtils {
	public static int getRandomNum(int start, int end) {
		Random random = new Random();

		int s = random.nextInt(end) % (end - start + 1) + start;
		return s;
	}

	public static void main(String[] args) {

		System.out.println(new RandomUtils().getRandomNum(10000000, 99999999));
	}
}
