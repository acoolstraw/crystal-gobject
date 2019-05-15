require "./cell_accessible"

module Gtk
  class ContainerCellAccessible < CellAccessible
    @pointer : Void*
    def initialize(pointer : LibGtk::ContainerCellAccessible*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGtk::ContainerCellAccessible*)
    end

    # Implements Action
    # Implements Component
    # Implements TableCell
    def self.new : self
      __return_value = LibGtk.container_cell_accessible_new
      cast Gtk::ContainerCellAccessible.new(__return_value)
    end

    def add_child(child)
      LibGtk.container_cell_accessible_add_child(@pointer.as(LibGtk::ContainerCellAccessible*), child.to_unsafe.as(LibGtk::CellAccessible*))
      nil
    end

    def children
      __return_value = LibGtk.container_cell_accessible_get_children(@pointer.as(LibGtk::ContainerCellAccessible*))
      GLib::ListIterator(Gtk::CellAccessible, LibGtk::CellAccessible**).new(GLib::SList.new(__return_value.as(LibGLib::List*)))
    end

    def remove_child(child)
      LibGtk.container_cell_accessible_remove_child(@pointer.as(LibGtk::ContainerCellAccessible*), child.to_unsafe.as(LibGtk::CellAccessible*))
      nil
    end

  end
end

