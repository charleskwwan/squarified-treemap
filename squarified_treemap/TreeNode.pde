class TreeNode {
  float value;
  TreeNode parent;
  ArrayList<TreeNode> children;
  
  TreeNode(float value) {
    this.value = value
    this.parent = null;
    this.children = new ArrayList<TreeNode>();
  }
}