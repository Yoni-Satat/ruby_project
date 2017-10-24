<div class="field">
  <label for="genre-id">Select an Genre: </label>
  <select name="genre_id" id="genre-id">
    <% for genre in @genre %>
    <option value="<%= genre.id %>"><%=genre.name%></option>
    <% end %>
  </select>
</div>
