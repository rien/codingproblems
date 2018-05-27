use std::collections::HashSet;


pub fn pairsum(vec: &Vec<usize>, k: usize) -> bool {
    let mut set = HashSet::new();
    for &v in vec {
        if set.contains(&v) {
            return true;
        }
        if v <= k {
            let diff = k - v;
            set.insert(diff);
        }
    }
    return false;
}



#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pairsum() {
        assert!(pairsum(&vec![10, 15, 3, 7], 17));
        assert!(!pairsum(&vec![10, 15, 3, 7], 20));
        assert!(pairsum(&vec![10, 0, 3, 7], 7));
        assert!(!pairsum(&vec![10, 0, 3, 7], 0));
        assert!(pairsum(&vec![10, 0, 3, 0], 0));
    }
}
