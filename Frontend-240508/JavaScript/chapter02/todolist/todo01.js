// 문서 객체 가져오기
const input = document.querySelector("#todo");
const todoList = document.querySelector("#todo-list");
const addButton = document.querySelector("#add-button");

let keyCount = 0;

// 할일을 추가하는 함수
const addTodo = () => {
  // 공백 입력 체크
  // - input에 입력 내용이 없을 시 alert창으로 알림
  if (input.value.trim().length <= 0) {
    alert("할 일을 입력해주세요");
    return;
  }

  // 할일 객체 생성
  const item = document.createElement("div");
  const checkbox = document.createElement("input");
  const text = document.createElement("span");
  const button = document.createElement("button");

  // 할일 객체 속성 추가
  checkbox.type = "checkbox"; // - checkbox
  text.textContent = input.value; // - input - 텍스트 입력 값
  input.value = ""; // 초기화
  button.textContent = "X";
  let itemKey = keyCount++; // 입력된 할일 개수만큼 카운트 증가
  item.setAttribute("data-key", itemKey);

  // div인 item에 checkbox, text, button 상속
  item.appendChild(checkbox);
  item.appendChild(text);
  item.appendChild(button);

  todoList.appendChild(item);

  // 체크박스에 체크가 되면 할일 텍스트에 취소선 추가됨
  checkbox.addEventListener("change", (e) => {
    text.style.textDecoration =
      e.currentTarget.checked ? "line-through" : "none";
  })

  // X 버튼 클릭 시 할일 삭제됨
  button.addEventListener("click", () => {
    removeTodo(itemKey);
  })

  item.style.textAlign = "left";
  text.style.fontSize = "13px";
  text.style.fontFamily = "Nanum Gothic Coding";
  text.style.padding = "5px";
  input.style.fontFamily = "Nanum Gothic Coding";
  button.style.alignItems = "center";
  button.style.borderRadius = "3px";

}

// 할일 제거 함수
const removeTodo = (key) => {
  const removeItem = document.querySelector(`[data-key="${key}"]`);
  if (removeItem) {
    todoList.removeChild(removeItem);
  }
}

// + 버튼 클릭 시 실행됨
addButton.addEventListener("click", addTodo);