package Clean;


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TeamFormation {
	
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("팀을 편성할 인원 수를 입력하세요 (최소 10명 이상): ");
        int totalPeople = scanner.nextInt();
        
        if (totalPeople < 10) {
            System.out.println("최소 10명 이상이어야 합니다.");
            return;
        }
        
        List<List<Integer>> teams = formTeams(totalPeople);
        displayTeams(teams);
    }

    public static List<List<Integer>> formTeams(int totalPeople) {
        List<List<Integer>> teams = new ArrayList<>();
        int remainingPeople = totalPeople;
        int current = 1; // 사람 번호
        
        while (remainingPeople > 0) {
            // 남은 인원이 3명보다 작으면 그룹을 3명으로 구성
            int groupSize = Math.min(remainingPeople, 3);
            // 남은 인원이 4명 이상이면 3 또는 4명으로 랜덤하게 구성
            if (remainingPeople >= 4) {
                groupSize = (int)(Math.random() * 2) + 3;
            }
            
            List<Integer> team = new ArrayList<>();
            for (int i = 0; i < groupSize; i++) {
                team.add(current++);
            }
            teams.add(team);
            remainingPeople -= groupSize;
        }
        
        return teams;
    }

    public static void displayTeams(List<List<Integer>> teams) {
        for (int i = 0; i < teams.size(); i++) {
            System.out.print("Team " + (i + 1) + ": ");
            List<Integer> team = teams.get(i);
            for (int j = 0; j < team.size(); j++) {
                System.out.print(team.get(j));
                if (j < team.size() - 1) {
                    System.out.print(", ");
                }
            }
            System.out.println();
        }
    }
}

