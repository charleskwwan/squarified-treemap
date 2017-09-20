class Tree {
 HashMap<Integer, Float> weights;
 HashMap<Integer, ArrayList<Integer>> relations;
 TreeNode root;
 
 Tree(HashMap<Integer, Float> weights, HashMap<Integer, ArrayList<Integer>> relations, int rootID) {
    this.weights = weights;
    this.relations = relations;
    
    ArrayList<TreeNode> c = new ArrayList<TreeNode>();
    this.root = new TreeNode(-1, null, c);  
    createTree(rootID); 
 }
 
 void createTree(int rootID) {
   if (root != null) {
     ArrayList<Integer> child = relations.get(rootID);
     ArrayList<TreeNode> toAddChild = new ArrayList<TreeNode>();
     int sum = 0;
     for (int i = 0; i < child.size(); i++) {
       TreeNode n = add(child.get(i));
       sum+= n.value;
       toAddChild.add(n);
     }
     root.value = sum;
     println("rotorototo" + root.value);
     root.children = toAddChild;

   }
 }
 
 TreeNode add(int id) {
   ArrayList<Integer> children = relations.get(id);
   ArrayList<TreeNode> toAddChild = new ArrayList<TreeNode>();
   TreeNode curr = new TreeNode(-1, null, null);
   TreeNode currChild;
   int sum = 0;
   if (children != null) {
     for (int i = 0; i < children.size(); i++) {
       currChild = add(children.get(i));
       currChild.parent = curr;
       
       toAddChild.add(currChild);
       sum += currChild.value;
     }
     curr.children = toAddChild;
     curr.value = sum;
   } else { //current node is a leaf node
     curr = new TreeNode(weights.get(id), null, null);
   }
   
    return curr; 
 }
 Boolean isEmpty(TreeNode root) {
   return (root == null);
 }
 
 void printTree(Tree t) {
  TreeNode rt = t.root;
  if (rt != null) {
    println("[" + rt.value + "]");
    inOrder(rt.children);
  }
 }
 
 void inOrder(ArrayList<TreeNode> children) {
   
   if (children != null) {
     print("[");
     TreeNode curr;
     for (int i = 0; i < children.size(); i++) {
       curr = children.get(i);
       inOrder(curr.children);
       print(curr.value + " ");
     }
      print("]");
     println("");
   }

 
 }
 

}