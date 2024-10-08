import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer";
export default class extends Controller {
  connect() {
    if(!this.channel) this.channel = this.createChannel();
  }

  disconnect() {
    this.channel.unsubscribe();
  }

  createChannel() {
    return consumer.subscriptions.create({
      channel: "DashboardChannel"
    }, {
      received: (data) => {
        this.updateTable(data.restaurants_table)
      }
    })
  }

  updateTable(table) {
    const tableContainer = document.getElementById('restaurants-statuses')
    tableContainer.innerHTML = table
  }
}