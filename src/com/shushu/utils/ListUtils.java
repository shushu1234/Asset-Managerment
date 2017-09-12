package com.shushu.utils;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.shushu.domain.Kind;

public class ListUtils {
	public List<Kind> removedRepeat(List<Kind> srcList) {
		Set<Kind> s = new TreeSet<Kind>(new Comparator<Kind>() {

			@Override
			public int compare(Kind o1, Kind o2) {
				// TODO Auto-generated method stub
				return o1.getName().compareTo(o2.getName());
			}

		});
		s.addAll(srcList);
		return new ArrayList<Kind>(s);
	}
}
