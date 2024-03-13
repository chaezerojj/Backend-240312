package chapter02;

public class IntroduceMyself {

	public static void main(String[] args) {
		//Q. 자기소개 및 좋아하는 것 5개를 다양한 변수 선언을 통해 콘솔 출력
		// 변수 선언과 사용에 중점을 두어 코드 작성
		// boolean, int, double, String
		
		//! 자기소개
		String name = "진채영";
		double height = 170.1;
		int footSize = 245;
		String bloodType = "B";
		String city = "부산";
		boolean livedOtherCity = false;
		
		// System.out.println(); - 개행 O
		// System.out.print(); - 개행 X
		
		System.out.println("안녕하세요, 제 이름은 " + name + "입니다."); 
		System.out.println("키는 " + height + "이며, 신발 사이즈는 " + footSize + "cm 입니다.");
		System.out.println("제 혈액형은 " + bloodType + "형 입니다.");
		System.out.println("제가 사는 곳은 " + city + "입니다.");
		System.out.println(city + "이외 다른 곳에 거주한 사실이 있다는 것은 " + livedOtherCity + "입니다.");
		System.out.println();
		
		//! 좋아하는 것
		String studyCoding = "코딩";
		String computerLanguage = "java";
		double EngtypingSpeed = 350.65;
		int studyingTime = 7;
		String job = "웹 개발자";
		boolean backEnd = true;
		String Lang1= "Java Script, ";
		String Lang2 = "Type Script, ";
		String Lang3 = "React";
		System.out.println("저는 " + studyCoding + "을 공부하는 것을 좋아합니다.");
		System.out.println("제가 공부하고 있는 컴퓨터 언어는 " + computerLanguage + "입니다.");
		System.out.println("영어 타자 속도는 평균 " + EngtypingSpeed + "입니다.");
		System.out.println(studyCoding + "공부를 주 " + studyingTime + "회 공부하고 있습니다.");
		System.out.println("제 목표는 " + job + "가 되는 것입니다.");
		System.out.print("현재 백앤드 개발자를 희망하는 것은 " + backEnd + "이지만, ");
		System.out.println("백앤드만 공부하고 있는 것은 " + !backEnd + "입니다.");
		System.out.println("제가 공부했던 언어들은 " + Lang1 + Lang2 + Lang3 + "입니다.");
		System.out.println();
		
		String exercise = "요가";
		int exerciseTime = 5;
		int startExercise = 8;
		String nextExercise = "테니스";
		System.out.println("좋아하는 운동은 " + exercise + "입니다.");
		System.out.println("저는 일주일에 " + exercise + "를 " + exerciseTime + "회 합니다.");
		System.out.println(exercise + "를 작년 " + startExercise + "월에 시작했습니다.");
		System.out.println(exercise + " 다음으로 하고 싶은 운동은 " + nextExercise + "입니다.");
		System.out.println();
		
		String hobby = "영화보기";
		int movieTimeaWeek = 4;
		String lastMovie = "파묘";
		String lastMovieCharacter = "이화림";
		String movieCharacterJob = "무당";
		System.out.println("제 취미는 " + hobby + "이며, 한달에 " + movieTimeaWeek + "편 정도 봅니다.");
		System.out.println("가장 최근에 본 영화는 " + lastMovie + "입니다.");
		System.out.println(lastMovie + "에서 인상깊은 캐릭터는 " + lastMovieCharacter + "였습니다.");
		System.out.println(lastMovieCharacter + "의 직업은 " + movieCharacterJob + "입니다.");
		System.out.println();
		
		String otherHobby = "책 읽기";
		double bookaMonth = 1.45;
		String favBookCategory = "소설";
		String lastBook = "수확자";
		int ScytheSeries = 3;
		String ScytheAuthor = "Neal Shusterman";
		boolean onlyFiction = false;
		String nowReadingBook = "프로젝트 헤일메리";
		String projectHailMaryAuthor = "Andy Weir";
		boolean isOnMakingFilm = true;
		System.out.println("또 다른 취미는 " + otherHobby + "입니다.");
		System.out.println("저는 한달 평균 " + bookaMonth + "권의 책을 읽고 있습니다.");
		System.out.println("즐겨 읽는 분야는 " + favBookCategory + "입니다.");
		System.out.println("가장 최근에 읽은 책은 " + lastBook + "이며 작가는 " + ScytheAuthor + "입니다.");
		System.out.println(lastBook + "은 총 " + ScytheSeries + "권의 시리즈로 이어지는 책입니다.");
		System.out.println("그리고 지금 읽고 있는 책은 " + nowReadingBook + "입니다.");
		System.out.println(nowReadingBook + "의 작가는 " + projectHailMaryAuthor + "입니다.");
		System.out.println(lastBook + "과 " + nowReadingBook + "은 영화와 드라마로 제작중에 있는 것은 " + isOnMakingFilm + "입니다.");
		System.out.println(favBookCategory + "를 주로 즐겨 읽지만 " + favBookCategory + "만을 읽는 것은 " + onlyFiction + "입니다.");
		System.out.println();
		
		String favoriteMovie = "해리포터";
		int harryPotterSeries = 7;
		int FavCharacter = 2;
		String CharacterName1 = "Sirius Black";
		boolean isCharacterDeath = true;
		String CharacterName2 = "Luna Lovegood";
		System.out.println("가장 좋아하는 영화는 " + favoriteMovie + "이며, 시리즈가 총 " + harryPotterSeries + "개 입니다.");
		System.out.println("해리포터 속 좋아하는 캐릭터들은 " + FavCharacter + "명 입니다.");
		System.out.println("첫번째로 좋아하는 인물은 " + CharacterName1 + "이며, 캐릭터가 마지막에 죽는 것은 " + isCharacterDeath + "입니다.");
		System.out.println("두번째로 좋아하는 인물은 " + CharacterName2 + "이며, 캐릭터가 마지막에 죽는 것은 " + !isCharacterDeath + "입니다.");
		System.out.println();
		
		String favoriteDrama = "비밀의 숲";
		int dramaCount = 5;
		boolean nextDramaSeries = true;
		String favDramaCharacter = "한여진";
		String dramaCharacterJob = "경찰";
		System.out.println("가장 좋아하는 드라마는 " + favoriteDrama + "이며, 그동안 " + dramaCount + "번 이상 보았습니다.");
		System.out.println(favoriteDrama + "속 가장 좋아하는 캐릭터는 " + favDramaCharacter + "입니다.");
		System.out.println(favoriteDrama + "에서 " + favDramaCharacter + "의 직업은 " + dramaCharacterJob + "입니다.");
		System.out.println(favoriteDrama + "은 시즌 2까지 있는 드라마라는 것은 " + nextDramaSeries + "입니다.");
		System.out.println();
		
		String coffee = "아이스 아메리카노";
		boolean coffeeTime = true;
		boolean onlyIceAmericano = false;
		String favCoffeeBrand = "폴바셋";
		System.out.println("저는 " + coffee + "를 즐겨마시며 매일 커피를 마시는 것은 " + coffeeTime + "입니다.");
		System.out.println("하지만 매일 " + coffee + "를 마시는 것은 " + onlyIceAmericano + "입니다.");
		System.out.println("가장 좋아하는 커피브랜드는 " + favCoffeeBrand + "입니다.");
		System.out.println();
		
		String football = "축구";
		int watchFootballTime = 2;
		String EPL = "EPL";
		String favPlayer = "손흥민";
		String footballTeam = "Tottenham Hotspur";
		int tottenhamRanking = 5;
		int shootScore = 14;
		int helpPoint = 8;
		boolean isTopScorer = true;
		boolean isCaptain = true;
		boolean isKeyPlayer = true;
		System.out.println("제가 가장 즐겨보는 스포츠는 " + football + "입니다.");
		System.out.println("저는 주로 " + football + "를 주 " + watchFootballTime + "회 정도 시청합니다.");
		System.out.println("주로 보는 리그는 " + EPL + "이며 좋아하는 선수는 " + favPlayer + "입니다.");
		System.out.println("현재 " + favPlayer + "의 소속팀은 " + footballTeam + "입니다.");
		System.out.println("현재 프리미어리그 23/24 시즌 " + footballTeam + "의 순위는 " + tottenhamRanking + "위 입니다.");
		System.out.println(favPlayer + "가 " + footballTeam + "에서 주장을 맡고 있는 것은 " + isCaptain + "입니다.");
		System.out.println(favPlayer + "는 오늘 기준 " + shootScore + "골 " + helpPoint + "도움을 기록했습니다.");
		System.out.println(favPlayer + "가 " + EPL + "21/22 시즌 득점왕을 한 사실은 " + isTopScorer + "입니다.");
		System.out.println(favPlayer + "는 현재 " + footballTeam + "에서 가장 활약하는 선수라는 것은 " + isKeyPlayer + "입니다.");
		System.out.println();
		
		String nowInterest = "야구";
		int baseballPlayTime = 6;
		String pitcher = "류현진";
		double pitcherER = 4.38;
		boolean isManyScoreWin = false;
		String differentRule = "경기규칙이 달라서";
		String lastSeasonWinner = "LG 트윈즈";
		String interestingTeam1 = "롯데 자이언츠";
		String interestingTeam2 = "기아 타이거즈";
		boolean isBusanTeam = true;
		System.out.println("요즘 관심 있는 스포츠는 " + nowInterest + "입니다.");
		System.out.println(nowInterest + "는 주 " + baseballPlayTime + "회 경기를 합니다.");
		System.out.println("현재 한국에서 가장 인기있는 선수 중 한 명은 " + pitcher + "입니다.");
		System.out.println(pitcher + "의 지난 시즌 평균자책점은 " + pitcherER + " 였습니다.");
		System.out.println(nowInterest + "에 관심이 가는 이유는 " + football + "과 " + differentRule + "이기 때문입니다.");
		System.out.println(nowInterest + "는 점수를 많이 내면 이길 수 있다는 것은 " + isManyScoreWin + "입니다.");
		System.out.println("지난 정규 시즌과 한국시리즈 우승 팀은 " + lastSeasonWinner + "입니다.");
		System.out.println("현재 관심있는 야구 팀은 " + interestingTeam1 + "과 " + interestingTeam2 + "입니다.");
		System.out.print(interestingTeam1 + "은 부산 연고지 팀인 것이 " + isBusanTeam + "이지만, ");
		System.out.println(interestingTeam2 + "이 부산 연고지 팀인 것은 " + !isBusanTeam + "입니다.");
		
		
		
	}

}
