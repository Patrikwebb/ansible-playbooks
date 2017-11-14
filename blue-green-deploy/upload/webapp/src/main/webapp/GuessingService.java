package main.webapp;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class GuessingService {
	private final static int ANSWER = 42;
	
	@PersistenceContext(unitName = "webapp")
	private EntityManager entityManager;

	public String guess(int number) {
		Guess guess = new Guess();
		guess.setNumber(number);
		entityManager.persist(guess);
		
		if (number < ANSWER) {
			return "Higher";
		} else if (number == ANSWER) {
			return "Correct";
		} else {
			return "Lower";
		}
	}
}
