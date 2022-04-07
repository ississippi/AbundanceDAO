(function(window, undefined) {
  var dictionary = {
    "e093480c-c9ff-4893-9dfb-59e040484556": "submit complete",
    "963634aa-22d5-4982-8fd3-6d2531d443d7": "Proposal Vote",
    "4c4b1172-04c1-472a-be29-aaaf5103d307": "Review Proposal",
    "cda3aa12-b95b-4e87-b839-c8fabef7eee4": "Make a proposal",
    "3c2d863b-9860-4009-bd4e-3233a50e2c06": "Vote",
    "03089561-5c94-4dab-bdc4-3e73218bb552": "New Member Detail",
    "86131e5e-6d19-4f67-8936-55fee30eea4c": "Homescreen 1",
    "b67a4a77-848f-4195-8234-a4d83650aad4": "Vote submitted",
    "7b464eeb-f543-4c88-ac3e-620b9548a8b0": "Contact invitation submitted",
    "34a977c1-93ac-45d1-926b-2f7c67acc3aa": "Contacts",
    "02d2b7a2-eec7-4aaa-a7fa-6def12ffe2ac": "Make a proposal_0",
    "d12245cc-1680-458d-89dd-4f0d7fb22724": "Homescreen",
    "e7be713e-a68f-4e31-9913-8ab44b516a17": "Invite member",
    "f39803f7-df02-4169-93eb-7547fb8c961a": "Template 1",
    "bb8abf58-f55e-472d-af05-a7d1bb0cc014": "default"
  };

  var uriRE = /^(\/#)?(screens|templates|masters|scenarios)\/(.*)(\.html)?/;
  window.lookUpURL = function(fragment) {
    var matches = uriRE.exec(fragment || "") || [],
        folder = matches[2] || "",
        canvas = matches[3] || "",
        name, url;
    if(dictionary.hasOwnProperty(canvas)) { /* search by name */
      url = folder + "/" + canvas;
    }
    return url;
  };

  window.lookUpName = function(fragment) {
    var matches = uriRE.exec(fragment || "") || [],
        folder = matches[2] || "",
        canvas = matches[3] || "",
        name, canvasName;
    if(dictionary.hasOwnProperty(canvas)) { /* search by name */
      canvasName = dictionary[canvas];
    }
    return canvasName;
  };
})(window);