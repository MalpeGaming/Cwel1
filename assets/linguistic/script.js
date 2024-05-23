let text = "";
const mainElement = document.getElementById(':r58:');
if (mainElement) {
    for (let i = 0; i < 200; i++) {
        (function(index) {
            const questionElement = mainElement.childNodes[0]?.childNodes[index]?.childNodes[0]?.childNodes[1]?.childNodes[0]?.childNodes[0]?.childNodes[0];
            if (questionElement) {
                text += "  - answers:\n";
                let dataParts = questionElement.data.split(":")[1].split('\n');
                text += '    - ' + dataParts[1]?.slice(3) + '\n';
                text += '    - ' + dataParts[2]?.slice(3) + '\n';
                text += '    - ' + dataParts[3]?.slice(3) + '\n';
                text += '    question: ' + questionElement.data.split(":")[0] + '\n';
            }
        })(i);
    }
    console.log(text);
} else {
    console.log("Element with this ID not found.");
}