class TreeNode {
  float value;
  TreeNode parent;
  ArrayList<TreeNode> children;
  
  TreeNode(float val, TreeNode parent, ArrayList<TreeNode> children) {
      value = val;
      this.parent = parent;
      this.children = children;
  }
}